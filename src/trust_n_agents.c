
#define S_FUNCTION_NAME  trust_n_agents
#define S_FUNCTION_LEVEL 2

#include "simstruc.h"
#include "math.h"


/* Function: mdlInitializeSizes ===============================================
 * Abstract:
 *   Setup sizes of the various vectors.
 */

static void mdlInitializeSizes(SimStruct *S)
{
    ssSetNumSFcnParams(S, 0);
    if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) {
        return; /* Parameter mismatch will be reported by Simulink */
    }
    
    /* the number of input ports that a block has */
    if (!ssSetNumInputPorts(S, 8)) return;

	/* number of agents */
    ssSetInputPortWidth(S, 0, DYNAMICALLY_SIZED);
    ssSetInputPortDirectFeedThrough(S, 0, 1);

	/* adaptation */
    ssSetInputPortWidth(S, 1, DYNAMICALLY_SIZED);
    ssSetInputPortDirectFeedThrough(S, 1, 1);

	/* matrix A */
	ssSetInputPortMatrixDimensions(S, 2, DYNAMICALLY_SIZED, DYNAMICALLY_SIZED);
	ssSetInputPortDirectFeedThrough(S, 2, 1);

	/* zeta */
	ssSetInputPortMatrixDimensions(S, 3, DYNAMICALLY_SIZED, DYNAMICALLY_SIZED);
    ssSetInputPortDirectFeedThrough(S, 3, 1);
	
	/* sigma */
	ssSetInputPortMatrixDimensions(S, 4, DYNAMICALLY_SIZED, DYNAMICALLY_SIZED);
	ssSetInputPortDirectFeedThrough(S, 4, 1);

	/* delta */
	ssSetInputPortMatrixDimensions(S, 5, DYNAMICALLY_SIZED, DYNAMICALLY_SIZED);
    ssSetInputPortDirectFeedThrough(S, 5, 1);

	/* K - adaptation gain */
	ssSetInputPortWidth(S, 6, DYNAMICALLY_SIZED);
	ssSetInputPortDirectFeedThrough(S, 6, 1) ;

    /* eta -  */
	ssSetInputPortWidth(S, 7, DYNAMICALLY_SIZED);
	ssSetInputPortDirectFeedThrough(S, 7, 1) ;
    
    /* the number of output ports that a block has */
    if (!ssSetNumOutputPorts(S,3)) return;

	ssSetOutputPortMatrixDimensions(S, 0, DYNAMICALLY_SIZED, DYNAMICALLY_SIZED);
	ssSetOutputPortMatrixDimensions(S, 1, DYNAMICALLY_SIZED, DYNAMICALLY_SIZED);
	ssSetOutputPortMatrixDimensions(S, 2, DYNAMICALLY_SIZED, DYNAMICALLY_SIZED);
   
    /* specify the number of sample times that an S-Function block has */
    ssSetNumSampleTimes(S, 1);

    /* specify the sim state compliance to be same as a built-in block */
    ssSetSimStateCompliance(S, USE_DEFAULT_SIM_STATE);

    ssSetOptions(S,
                 SS_OPTION_WORKS_WITH_CODE_REUSE |
                 SS_OPTION_EXCEPTION_FREE_CODE |
                 SS_OPTION_USE_TLC_WITH_ACCELERATOR);
}


#if defined(MATLAB_MEX_FILE)

#define MDL_SET_INPUT_PORT_DIMENSION_INFO
#define MDL_SET_OUTPUT_PORT_DIMENSION_INFO
#define MDL_SET_DEFAULT_PORT_DIMENSION_INFO

static void mdlSetInputPortDimensionInfo(SimStruct *S, int_T port, const DimsInfo_T *dimsInfo)
{
	if (!ssSetInputPortDimensionInfo(S, port, dimsInfo)) 
	return;
}

static void mdlSetOutputPortDimensionInfo(SimStruct *S, int_T port, const DimsInfo_T *dimsInfo)
{
	if (!ssSetOutputPortDimensionInfo(S, port, dimsInfo)) 
	return;
}
#endif  /* MATLAB_MEX_FILE */


#if defined(MDL_SET_DEFAULT_PORT_DIMENSION_INFO) && defined(MATLAB_MEX_FILE)
static void mdlSetDefaultPortDimensionInfo(SimStruct *S)
{
	int_T outWidth = ssGetOutputPortWidth(S, 0);
	int_T   *dims  = ssGetInputPortDimensions(S, 2);
	
	if(outWidth == DYNAMICALLY_SIZED){
		if(!ssSetOutputPortMatrixDimensions(S, 0, dims[0], dims[0])) return;
		if(!ssSetOutputPortMatrixDimensions(S, 1, dims[0], dims[0])) return;
		if(!ssSetOutputPortMatrixDimensions(S, 2, dims[0], dims[0])) return;
	} 
}
#endif /* MDL_SET_DEFAULT_PORT_DIMENSION_INFO */


/* Function: mdlInitializeSampleTimes =========================================
 * Abstract:
 *    Specifiy that we inherit our sample time from the driving block.
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, INHERITED_SAMPLE_TIME);
    ssSetOffsetTime(S, 0, 0.0);
    ssSetModelReferenceSampleTimeDefaultInheritance(S); 
}


int sign(real_T a) {
	return (fabs(a) < pow(10,-3)) ? 0 : (a < (-pow(10,-3)) ? -1 : 1);
}


/* Function: mdlOutputs =======================================================
*/
static void mdlOutputs(SimStruct *S, int_T tid)
{
    int_T             i, j, num, k, l, flag = 1;

	InputRealPtrsType uPtrs0 = ssGetInputPortRealSignalPtrs(S,0);  
	InputRealPtrsType uPtrs1 = ssGetInputPortRealSignalPtrs(S,1);  
	InputRealPtrsType uPtrs2 = ssGetInputPortRealSignalPtrs(S,2);  
	InputRealPtrsType uPtrs3 = ssGetInputPortRealSignalPtrs(S,3);    
	InputRealPtrsType uPtrs4 = ssGetInputPortRealSignalPtrs(S,4);   
	InputRealPtrsType uPtrs5 = ssGetInputPortRealSignalPtrs(S,5); 
	InputRealPtrsType uPtrs6 = ssGetInputPortRealSignalPtrs(S,6); 
    InputRealPtrsType uPtrs7 = ssGetInputPortRealSignalPtrs(S,7);
	
	real_T            *(y0) = ssGetOutputPortRealSignal(S,0);    
	real_T			  *(y1) = ssGetOutputPortRealSignal(S,1);
	real_T			  *(y2) = ssGetOutputPortRealSignal(S,2);

	num = *uPtrs0[0];  /* number of agents */

	for (i=0; i< num; i++) {
		for (j=0; j < num; j++) {
			(y0)[j*num + i] = 0;
			(y1)[j*num + i] = 0;
			(y2)[j*num + i] = 0;
		}
	} 

	for (i=0; i<num; i++) {
		for (j=0; j < num; j++) {
			if (*uPtrs2[j*num + i] == 1) {

				/* observation function */
				(y2)[j*num + i] = exp (-pow((*uPtrs5[j*num + i]), 2) / pow((*uPtrs4[j*num + i]) ,2));
			
				/* consensus protocol */ 
				for (k=0; k < num; k++) {
					if (flag == 1) {
						for (l=0; l < num; l++){
					 		(y0)[l*num + i] = 0;						
						}
						flag = 0;
					} 
					(y0)[k*num + i] = (y0)[k*num +i] + (*uPtrs3[j*num + i]) * sign(*uPtrs3[k * num + j] - *uPtrs3[k * num + i]); 
				}

				/* add observation-based trust value */
				(y0)[j*num + i] = (y0)[j*num + i] + sign((y2)[j*num + i] -  *uPtrs3[j*num + i]);

				/* adaptation law - confidence */
				if (*uPtrs1[0] > 0)
					(y1)[j*num + i] = - (*uPtrs6[0]) * sign((y2)[j*num + i] - *uPtrs3[j*num + i]) ;  
				else
					(y1)[j*num + i] = 0; 
			}
		}
	}
}


/* Function: mdlTerminate =====================================================
 * Abstract:
 *    No termination needed, but we are required to have this routine.
 */
static void mdlTerminate(SimStruct *S)
{
}

#ifdef  MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif

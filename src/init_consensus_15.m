clear all;

n = 15;
% change A for different topology
% BL
A1 = [0 1 1 0 0 0 0 0 0 0 0 0 0 0 0;
      1 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
      1 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
      0 1 1 0 1 0 0 0 0 0 0 0 0 0 0;
      0 0 1 1 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 1 1 0 0 0 0 0 0 0;
      0 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 1 1 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 1 1 0 0 0 0;
      0 0 0 0 0 0 0 0 1 0 0 1 0 0 0;
      0 0 0 0 0 0 0 0 1 0 0 1 0 0 0;
      0 0 0 0 0 0 0 0 0 1 1 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
      0 0 0 0 0 0 0 0 0 0 0 0 1 0 1;
      0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;];
%A1 = zeros(n);
% acoustics
A2 = ones(n) - eye(n);
%A2 = zeros(n);
% communication period for scheduled communication
Td1 = 1;
Td2 = 3;
% algorithm step
eps = 0.01;
% initial value of x
x0 = [19    14   135   199   238    33   145   120     3    86    41   203    79   135    42]; 
% round((255-0).*rand(1,n));
%x0 = [26 26 26 125 125];
% comm type (1=ideal comm, 2=sequenced comm)
comm_type1=2;
comm_type2=2;
% event based flag -- calculate only on message sent/received
event_based=0;
calc_rate=5;
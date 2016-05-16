%number of agents
prompt = 'Koji je broj riba? ';
n = input(prompt);
K=0.2;
adapt=1;
for i=1:8;
    if i<=n;
    vd(i,1)=0.3;
    vd(i,2)=0.2;
    X(i,1)=10*rand;
    Y(i,1)=10*rand;
    else
    vd(i,1)=0;
    vd(i,2)=0; 
    X(i,1)=0;
    Y(i,1)=0;
    end
end
sko_x=zeros(8,1);
sko_y=zeros(8,1);
sko_x=[0.5, 1.5, 4, 4.5, 5, 7, 8, 9.5];
sko_y=[8, 3, 5, 1, 4.5, 9, 3, 6];
sigma_0 = zeros(n,n);
c = zeros(n,n);

if (n==5) 
    sigma_0 = [ 0    0.7   0    0    0       
                1     0    1    0    1
                0    0.5   0   1.4   1
                0     0    1    0    0 
                0    0.4   1    0    0];
            
    c = [ 0   0.2   0   0   0 ; 
         0.8   0   0.4  0   1 ;
          0   0.2   0  0.6  1 ;
          0    0   0.4  0   0 ;
          0   0.2  0.4  0   0 ];
else
  for i=1:n 
    delta = roundn(rand(),-1);
    for j=1:n
        if A(j,i) == 1
            sigma_0(j,i) = roundn(rand(),-1);    
            c(j,i) = delta;
        end
    end
  end   
end

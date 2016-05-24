%number of agents
clear;
prompt = 'Koji je broj riba? ';
n = input(prompt);
K=0.2;
adapt=1;
for i=1:4;
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
sko_x=[0.5, 1.5, 4, 4.5, 5, 7, 8, 9.5];
sko_y=[8, 3, 5, 1, 4.5, 9, 3, 6];
sigma_0 = zeros(n);
c = zeros(n);
stream_x=[0.05,0.05,0.05,0.05];
stream_y=[0.03,0.03,0.03,0.03];
delta_0=zeros(n,1);
zeta_0 = zeros(n,n);
ko=ones(n,1);
for i = 1 : n
    for j = 1 : n
        if i == j
            zeta_0(i,j) = 1;        %initial trust regarding themselves
        else
            zeta_0(i,j) = 0;      %initial trust regarding their neighbours
        end
    end
end
  for i=1:n 
    delta = roundn(rand(),-1);
    for j=1:n
            sigma_0(j,i) = roundn(rand(),-1);    
            c(j,i) = delta;
    end
  end   

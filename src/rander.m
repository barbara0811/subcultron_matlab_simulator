
clc;
%number of agents
prompt = 'Koji je broj riba? ';
n = input(prompt);
K=0.2;
adapt=1
for i=1:20;
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
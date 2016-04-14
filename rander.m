clear all;
clc;
%number of agents
prompt = 'Koji je broj riba? ';
n = input(prompt);
for i=1:20;
    if i<=n;
    vd(i,1)=0.3;
    vd(i,2)=0.2;
    X(i,1)=20*rand;
    Y(i,1)=20*rand;
    else
    vd(i,1)=0;
    vd(i,2)=0; 
    X(i,1)=0;
    Y(i,1)=0;
end
end
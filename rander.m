clear all;
clc;

%number of agents
prompt = 'Koji je broj riba? ';
n = input(prompt);
for i=1:n;
    X(i,1)=20*rand;
    Y(i,1)=20*rand;
end
clear all;

% number of agents
n = 4;

% change A for different topology
A = ones(n) - eye(n);
% communication period for scheduled communication
Td = 5;
% algorithm step
eps = 0.1;
% initial value of x
x0 = [0 30 50 100];
% comm type (1=ideal comm, 2=sequenced comm)
comm_type=2;
% event based flag -- calculate only on message sent/received
event_based=1;

% initialization of random sigma matrix
sigma0 = zeros(n,n);
for i=1:n 
    for j=1:n
        if A(j,i) == 1
            sigma0(j,i) = roundn(rand(),-1);    
        end
    end
end
  
%initialization of trust values
zeta0 = zeros(n, n);
for i = 1 : n
    for j = 1 : n
        if i == j
            zeta0(i,j) = 1;        %initial trust regarding themselves
        elseif A(i,j) == 1
            zeta0(i,j) = 0.1;      %initial trust regarding their neighbours
        end
    end
end


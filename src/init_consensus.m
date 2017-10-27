clear all;

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
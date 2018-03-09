clear all;

n = 5;
% change A for different topology
A1 = ones(n) - eye(n);
% communication period for scheduled communication
Td1 = 1;
% algorithm step
eps = 0.01;
% initial value of x
x0 = [150 30 0 100 50];
% comm type (1=ideal comm, 2=sequenced comm)
comm_type1=2;
% event based flag -- calculate only on message sent/received
event_based=1;
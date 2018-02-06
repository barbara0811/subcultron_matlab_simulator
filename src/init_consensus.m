clear all;

n = 5;
% change A for different topology
% BL
A1 = [0 1 1 0 0;
      1 0 1 0 0;
      1 1 0 0 0;
      0 0 0 0 1;
      0 0 0 1 0];
A1 = zeros(n);
% acoustics
A2 = ones(n) - eye(n);
% communication period for scheduled communication
Td1 = 2;
Td2 = 7;
% algorithm step
eps = 0.01;
% initial value of x
x0 = [0 30 50 100 150];
% comm type (1=ideal comm, 2=sequenced comm)
comm_type1=2;
comm_type2=2;
% event based flag -- calculate only on message sent/received
event_based=0;
calc_rate=5;
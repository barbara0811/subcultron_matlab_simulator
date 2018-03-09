clear all;

n = 10;
% change A for different topology
% BL
%A1 = [0 1 1 0 0;
%      1 0 1 0 0;
%      1 1 0 0 0;
%      0 0 0 0 1;
%      0 0 0 1 0];
A1 = zeros(n);
% acoustics
A2 = ones(n) - eye(n);
%A2 = zeros(n);
% communication period for scheduled communication
Td1 = 1;
Td2 = 4;
% algorithm step
eps = 0.5;
% initial value of x
%x0 = [150 30 0 100 50];
%x0 = [73   139   251   182   214   110   120   143    69   191   128 165 78    35   121    92   201   199   170 34     5   143    77   240   250    73   204   229   152   225];
x0 = [61     7    67   191   110   242    22     4   157    54];
% comm type (1=ideal comm, 2=sequenced comm)
comm_type1=2;
comm_type2=2;
% event based flag -- calculate only on message sent/received
event_based=1;
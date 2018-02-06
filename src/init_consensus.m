clear all;

n = 4;
% change A for different topology

% case 1 --> original topology

A = [0 1 0 0 ;
   1 0 1 1 ;
   0 1 0 1 ;
   0 1 1 0 ]
%case 2 --> star topology
% A = ones(n)-eye(n);
% case 3 --> circular topology
%   A= [  0 1 0 1;
%         1 0 1 0;
%         0 1 0 1;
%         1 0 1 0;]


% communication period for scheduled communication
Td = 2;
% algorithm step
eps = 0.1;
% initial value of x
x0 = [0 30 50  100];
%x0 = [159,90,131,103,20,62,32,47,62,107,13,231,241,126,125,87,230,95,29,199,100,62,103,25,34,241,244,147,16,60,91,210,4,11,44,166,187,166,115,140,76,190,49,176,47,94,160,199,21,237,198,125,112,114,79,130,131,209,203,165,97,207,136,90,240,224,141,159,150,53,77,121,59,216,50,58,44,59,112,80,236,110,48,231,250,112,29,66,105,152,67,154,182,57,30,76,82,109,130,22];
% comm type (1=ideal comm, 2=sequenced comm)
comm_type=2;
% event based flag -- calculate only on message sent/received
event_based=1;
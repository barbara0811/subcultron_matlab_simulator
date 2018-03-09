model = 'basic_consensus_average';
load_system(model);

clear all;

n = 100;
% change A for different topology
% BL
A1 = zeros(n);
% acoustics
A2 = ones(n) - eye(n);
% communication period for scheduled communication
Td1 = 1;
Td2 = 1;
% initial value of x
x0 = 255.*rand(n,1);
% comm type (1=ideal comm, 2=sequenced comm)
comm_type1=2;
comm_type2=2;
% event based flag -- calculate only on message sent/received
event_based=0;


con_times = [];
con_values = [];
eps_ = [0.01, 0.05, 0.1, 0.2, 0.25];

for eps=eps_
    eps
    sim(model);
    calc_convergence;
    con_times = [con_times, conv_time];
    con_values = [con_values, x.Data(end,1)];
    
end

save('results\eps_100agents','con_times','con_values', 'eps_')
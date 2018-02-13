model = 'basic_consensus_average';
load_system(model);

con_times = [];
con_values = [];
eps_ = 0.01;
T1 = 1;
T2 = 3;
A1 = zeros(n);

for i=1:50
    i
    x0 = x0(randperm(size(x0,2)));
    sim(model);
    calc_convergence;
    con_times = [con_times, conv_time];
    con_values = [con_values, x.Data(end,1)];
end

save('results\convergence BL analysis - when to turn off\15amussels_3_noBL','con_times','con_values', 'BL_off_time')
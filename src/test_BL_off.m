model = 'basic_consensus_average';
load_system(model);

con_times = [];
con_values = [];
eps_ = 0.01;
T1 = 1;
T2 = 10;
%A1 = zeros(n);

for i=1:40
    i
    x0 = x0(randperm(size(x0,2)));
    sim(model);
    calc_convergence;
    con_times = [con_times, conv_time];
    con_values = [con_values, x.Data(end,1)];
end

save('results\newBlOffTest\15amussels_BL_1','con_times','con_values', 'BL_off_time')
%1.3180e+04 con time za 10
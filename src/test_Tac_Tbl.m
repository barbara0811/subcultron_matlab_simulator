model = 'basic_consensus_average';
load_system(model);

con_times = [];
con_values = [];
eps = 0.01;
Td1 = 1;
Td2_ = [1 2 3 4 5];

for Td2 = Td2_
    Td2
    for i=1:50
        i
        x0 = x0(randperm(size(x0,2)));
        sim(model);
        calc_convergence;
        con_times = [con_times, conv_time];
        con_values = [con_values, x.Data(end,1)];
    end
end

save('results\oscillatory behavior analysis - BL stays on\15amussels','con_times','con_values', 'Td2_');
model = 'basic_consensus_average';
load_system(model);

con_times = [];
con_values = [];
eps = 0.01;
Td1 = 1;
Td2_ = [1 2 5 10 20];  %5 10 20];

for Td2 = Td2_
    Td2
    for i=1:200
        i
        x0 = x0(randperm(size(x0,2)));
        sim(model);
        calc_convergence;
        con_times = [con_times, conv_time];
        con_values = [con_values, x.Data(end,1)];
    end
end

save('results\test_Tac_Tbl_5agents_200_', 'con_times', 'con_values', 'Td2_');
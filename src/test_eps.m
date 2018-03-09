model = 'basic_consensus_average';
load_system(model);

con_times = [];
con_values = [];
eps_ = [0.01, 0.1, 0.25, 0.5];

for eps=eps_
    eps
    for i=1:20
        i
        x0 = x0(randperm(size(x0,2)));
        sim(model);
        calc_convergence;
        con_times = [con_times, conv_time];
        con_values = [con_values, x.Data(end,1)];
    end
end

save('results\eps_100agents','con_times','con_values', 'eps_', 'x0', 'n')

n = 200;
m = size(Td2_,2);
xs = []; %zeros(m,50);
vals = []; %zeros(m,50);
times = zeros(1,m);
    
for i=1:m
    if con_times((i-1)*20+1) > -1
        vals = [vals; con_values((i-1)*20+1:i*20)];
        xs = [xs; Td2_(i).*ones(1,20)];
        times(i) = mean(con_times((i-1)*n+1:i*n));
    end
end

figure
hold on
boxplot(vals(:),xs(:))
xlabel('T_{ac}/T_{bl}')
ylabel('x')
%
%xlim([0 0.27])
hline = refline([0 99.4667]);
%hline = refline([0 66]);
hline.Color = 'g';
hline.LineStyle = '-.';
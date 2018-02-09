
m = size(Td2_,2);
xs = []; %zeros(m,50);
vals = []; %zeros(m,50);
for i=1:m
    if con_times((i-1)*50+1) > -1
        vals = [vals; con_values((i-1)*50+1:i*50)];
        xs = [xs; Td2_(i).*ones(1,50)];
    end
end

figure
hold on
boxplot(vals(:),xs(:))
xlabel('T_{ac}/T_{bl}')
ylabel('x')
%xlim([0 0.27])
hline = refline([0 99.4667]);
%hline = refline([0 66]);
hline.Color = 'g';
hline.LineStyle = '-.';
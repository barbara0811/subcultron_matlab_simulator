fnames = {'no_BL' 'BL' 'BL_01' 'BL_05' 'BL_1'};
%limits = [-1 0 0.1 0.5 1];
limits = [0 1 2 3 4];

m = size(fnames,2);
xs = zeros(m,39);
vals = zeros(m,39);
times = zeros(1,m);

%for i=1:m
%    load(['results\5amussels_10_' fnames{i}]);
%    vals(i,:) = con_values;
%    xs(i,:) = limits(i).*ones(1,50);
%    times(1,i) = mean(con_times);
%end

for i=1:m
    load(['results\newBlOffTest\15amussels_' fnames{i}]);
    vals(i,:) = con_values(1,39);
    xs(i,:) = limits(i).*ones(1,39);
    times(1,i) = mean(con_times);
end

neworder = {
    'C1'            [0]
    'C1 + C2'               [1]
    'C1 + C2, off at 0.1'              [2]
    'C1 + C2, off at 0.5'              [3]
    'C1 + C2, off at 1'                [4]};

%figure
%boxplot(vals(:),xs(:))
%set(gca,'XtickLabel',neworder(:,1))
%xlabel('limit')
%ylabel('x')
%xlim([0 1.1])
%hline = refline([0 99.4667]);
%hline = refline([0 66]);
%hline.Color = 'g';
%hline.LineStyle = '-.';
figure
plot(limits,times)
%bar(limits,times)
ylabel('t(s)')
set(gca,'XtickLabel',neworder(:,1))
xlabel('limit')
xticks([0 1 2 3 4])
title('T_{bl} = 1s, T_{ac} = 10s, \epsilon = 0.01')
%legend('5 agents', '15 agents')
%bar(times)
%fnames = {'BL stays on' '1' '0.5' '0.2' '0.1'}
%set(gca,'xticklabel',fnames)
%yticks(linspace(0,1500,11))

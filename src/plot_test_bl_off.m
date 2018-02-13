
fnames = {'noOff' '01' '02' '05' '1'}
limits = [0 0.1 0.2 0.5 1];
m = size(fnames,2);
xs = zeros(m,50);
vals = zeros(m,50);
times = zeros(2,m);
for i=1:m
    load(['results\convergence BL analysis - when to turn off\15amussels_3_' fnames{i}]);
    %vals(i,:) = con_values;
    xs(i,:) = limits(i).*ones(1,50);
    times(1,i) = mean(con_times);
end

for i=1:m
    load(['results\convergence BL analysis - when to turn off\5amussels_3_' fnames{i}]);
    %vals(i,:) = con_values;
    xs(i,:) = limits(i).*ones(1,50);
    times(2,i) = mean(con_times);
end

%figure
%boxplot(vals(:),xs(:))
%xlabel('limit')
%ylabel('x')
%xlim([0 1.1])
%hline = refline([0 99.4667]);
%hline = refline([0 66]);
%hline.Color = 'g';
%hline.LineStyle = '-.';
figure
plot(limits,times)
ylabel('t(s)')
%xlabel('x')
%bar(times)
%fnames = {'BL stays on' '1' '0.5' '0.2' '0.1'}
%set(gca,'xticklabel',fnames)
%yticks(linspace(0,1500,11))
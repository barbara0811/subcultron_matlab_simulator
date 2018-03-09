
n = 20;
m = size(eps_,2);
xs = zeros(m,n);
vals = zeros(m,n);
times = zeros(1,m);

for i=1:m
    vals(i,:) = con_values((i-1)*n+1:i*n);
    times(i) = mean(con_times((i-1)*n+1:i*n));
    xs(i,:) = eps_(i).*ones(1,n);
end

figure
boxplot(vals(:),xs(:))
xlabel('\epsilon')
ylabel('x')
%xlim([0 0.27])
%hline = refline([0 99.4667]);
%hline = refline([0 sum(x0)/30]);
hline.Color = 'g';
hline.LineStyle = '-.';
%title('5 agents, T_{ac} = 1');

figure
xs2 = {'0.01', '0.1', '0.25', '0.5'};
neworder = {
    '0.01'  [0]
    '0.1'   [1]
    '0.25'  [2]
    '0.5'   [3]};
plot([0 1 2 3], times) %bar(times,'FaceColor', [.42 .37 .73])
set(gca,'xticklabel',xs2)
xticks([0 1 2 3])
xlabel('\epsilon')
ylabel('t(s)')
%title('5 agents, T_{ac} = 1');
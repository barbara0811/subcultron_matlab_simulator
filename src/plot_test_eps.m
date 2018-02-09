epss = [0.01 0.05 0.1 0.2 0.25];
m = size(epss,2);
xs = zeros(m,50);
vals = zeros(m,50);
for i=1:m
    vals(i,:) = con_values((i-1)*50+1:i*50);
    xs(i,:) = epss(i).*ones(1,50);
end

figure
boxplot(vals(:),xs(:))
xlabel('\epsilon')
ylabel('x')
xlim([0 0.27])
hline = refline([0 99.4667]);
hline.Color = 'g';
hline.LineStyle = '-.';
close all

figure
xlabel('t(s)')
ylabel('x')
for i=1:n
    stairs(x.Time,reshape(x.Data(:,i),1,size(x.Data,1)))
    legendInfo{i} = ['X_{' num2str(i) '}'];
    hold on
end

legend(legendInfo)
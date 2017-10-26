close all

figure
xlabel('t(s)')
ylabel('x')
for i=1:n
    stairs(x.Time,reshape(x.Data(:,i),1,size(x.Data,1)))
    legendInfo{i} = ['X_{' num2str(i) '}'];
    %legend('x_{' + str(i) + '}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
    hold on
    
    %legend('\zeta_{15}', '\zeta_{25}', '\zeta_{35}', '\zeta_{45}', '\zeta_{55}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
    %axis([tmin tmax 0 1])
end

legend(legendInfo)
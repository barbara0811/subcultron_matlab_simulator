%close all

calc_convergence

figure
xlabel('t(s)')
ylabel('x')
for i=1:n
    stairs(x.Time,reshape(x.Data(:,i),1,size(x.Data,1)))
    legendInfo{i} = ['X_{' num2str(i) '}'];
    hold on
end

legend(legendInfo)
%title(['Td_{BL} ' num2str(Td1) ', Td_{ac} ' num2str(Td2) ' , eps ' num2str(eps), ', x* = ' num2str(x.Data(end,1)) ', t* = ' num2str(conv_time)])
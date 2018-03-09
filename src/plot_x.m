%close all

calc_convergence

c = hsv(n);
%c = jet(n);

figure

for i=1:n
    h = stairs(x.Time,reshape(x.Data(:,i),1,size(x.Data,1)));
    h.Color = c(i,:);
    legendInfo{i} = ['X_{' num2str(i) '}'];
    hold on
end

xlabel('t(s)')
ylabel('x')

%if conv_time ~= -1
%    xlim([0 50*(ceil((conv_time+30)/50.))])
%end

legend(legendInfo)
set(gca,'fontsize',18)
%pbaspect([1.4 1 1])
%title(['Td_{1}= ' num2str(Td1) 's, Td_{2}= ' num2str(Td2) 's, \epsilon = ' num2str(eps), ', x* = ' num2str(x.Data(end,1)) ', t* = ' num2str(conv_time)])
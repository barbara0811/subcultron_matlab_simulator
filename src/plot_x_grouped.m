%close all

calc_convergence

colors = zeros(n,3);
colors(1:5,:) = repmat([255 50 50]/255,5,1);
colors(6:8,:) = repmat([0 153 76]/255,3,1);
colors(9:12,:) = repmat([0 128 255]/255,4,1);
colors(13:15,:) = repmat([204 204 0]/255,3,1);

figures = [];

figure
xlabel('t(s)')
ylabel('x')
for i=1:n
    h = stairs(x.Time,reshape(x.Data(:,i),1,size(x.Data,1)));
    figures = [h figures];
    h.Color = colors(i,:)
    %legendInfo{i} = ['X_{' num2str(i) '}'];
    hold on
end

%if conv_time ~= -1
%    xlim([0 50*(ceil((conv_time+30)/50.))])
%end

%legend(legendInfo)
%title(['Td_{1}= ' num2str(Td1) 's, Td_{2}= ' num2str(Td2) 's, \epsilon = ' num2str(eps), ', x* = ' num2str(x.Data(end,1)) ', t* = ' num2str(conv_time)])
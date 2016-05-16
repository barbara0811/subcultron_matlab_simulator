figure(10)
colours = ['r','g','b','m','c','k','y','w'];
sko_x=transp(sko_x);
sko_y=transp(sko_y);
for i=1:8
    plot(xf.signals.values(:,i),yf.signals.values(:,i), 'LineWidth', 1.25)
    hold on
end
scatter(sko_x,sko_y,'diamond', 'k','filled')
legend('fish 1','fish 2','fish 3','fish 4','fish 5','fish 6','fish 7','fish 8','Orientation', 'Horizontal', 'Location', 'South')
grid on 
axis([0 10 0 10])

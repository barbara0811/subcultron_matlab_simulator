figure(11)
colours = ['r','g','b','m','c','k','y','w'];
for i=1:8
    plot(riba_x.signals.values(:,i),riba_y.signals.values(:,i), 'LineWidth', 1.25)
    hold on
    viscircles([sko_x(i),sko_y(i)],0.5,'LineStyle',' : ','LineWidth', 1.25,'EdgeColor','k');
end
scatter(sko_x,sko_y,'diamond','k','filled')
legend('fish 1','fish 2','fish 3','fish 4','fish 5','fish 6','fish 7','fish 8','Orientation', 'Horizontal', 'Location', 'South')
grid on 
axis([0 10 0 10])

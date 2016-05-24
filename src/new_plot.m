figure(11)
for i=1:4
    plot(riba_x.signals.values(:,i),riba_y.signals.values(:,i), 'LineWidth', 1.25)
    hold on
end
for i=1:8
     hold on
    viscircles([sko_x(i),sko_y(i)],1,'LineStyle',' : ','LineWidth', 1.25,'EdgeColor','k');
end
scatter(sko_x,sko_y,'diamond','k','filled')
legend('fish 1','fish 2','fish 3','fish 4','Orientation', 'Horizontal', 'Location', 'South')
grid on 
axis([0 10 0 10])
figure(12)
for i=1:4
    plot(fake_x(:,i),fake_y(:,i), 'LineWidth', 1.25)
    hold on
end
for i=1:8
     hold on
    viscircles([sko_x(i),sko_y(i)],1,'LineStyle',' : ','LineWidth', 1.25,'EdgeColor','k');
end
scatter(sko_x,sko_y,'diamond','k','filled')
legend('fish 1','fish 2','fish 3','fish 4','Orientation', 'Horizontal', 'Location', 'South')
grid on 
axis([0 10 0 10])
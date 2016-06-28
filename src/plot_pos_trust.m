%% PLOTANJE POZICIJA AGENATA
clc;
close all;
figure
subplot(2,1,1)
scatter(pos_0(1,:), pos_0(2,:), 'filled', 'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',4)
xlim([0 30])
ylim([0 30])
ylabel('Y-koordinata pozicija agenata')
xlabel('X-koordinata pozicija agenata')
title('Prikaz rasporeda agenata u prostoru')
grid on


%% plotanje pozicija
p1_x = reshape(pos(1,1,:),length(t),1);
p1_y = reshape(pos(2,1,:),length(t),1);

p2_x = reshape(pos(1,2,:),length(t),1);
p2_y = reshape(pos(2,2,:),length(t),1);

p3_x = reshape(pos(1,3,:),length(t),1);
p3_y = reshape(pos(2,3,:),length(t),1);

p4_x = reshape(pos(1,4,:),length(t),1);
p4_y = reshape(pos(2,4,:),length(t),1);

p5_x = reshape(pos(1,5,:),length(t),1);
p5_y = reshape(pos(2,5,:),length(t),1);


subplot(1,2,1)
plot(t, [p1_x, p2_x, p3_x, p4_x, p5_x], 'LineWidth',2)
grid on 
xlabel('t(s)')
ylabel('x')
title('X-pozicija aMussels-a')
legend('1', '2','3', '4','5', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis auto

subplot(1,2,2)
plot(t, [p1_y, p2_y, p3_y, p4_y, p5_y], 'LineWidth',2)
grid on 
xlabel('t(s)')
ylabel('y')
title('Y-pozicija aMussels-a')
legend('1', '2','3', '4','5', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis auto


%% PLOTANJE POZICIJA AGENATA
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

%% plotanje povjerenja
z1 = [];
z2 = [];
z3 = [];
z4 = [];
z5 = [];
T = [];
tmin=0;
tmax=10;

for i = 1 : 10 : length(t)
    z1 = [z1; reshape(zeta(1,:,i), 1, 5)];
    z2 = [z2; reshape(zeta(2,:,i), 1, 5)];
    z3 = [z3; reshape(zeta(3,:,i), 1, 5)];
    z4 = [z4; reshape(zeta(4,:,i), 1, 5)];
    z5 = [z5; reshape(zeta(5,:,i), 1, 5)];
    T = [T; t(i)];
end


subplot(2,1,2)
plot(T, [z1(:,1), z2(:,1), z3(:,1), z4(:,1), z5(:,1)], 'LineWidth', 2);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 1 uz r=5')
legend('\zeta_{11}', '\zeta_{21}','\zeta_{31}', '\zeta_{41}','\zeta_{51}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])


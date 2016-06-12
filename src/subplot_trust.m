colours = ['r','g','b','m','c','k','k'];
z1 = [];
z2 = [];
z3 = [];
z4 = [];
z5 = [];
T = [];

z1_05 = [];
z2_05 = [];
z3_05 = [];
z4_05 = [];
z5_05 = [];
T_05=[];

z1_01 = [];
z2_01 = [];
z3_01 = [];
z4_01 = [];
z5_01 = [];
T_01=[];

for i = 1 : 10 : length(t)
    z1 = [z1; reshape(zeta(1,:,i), 1, 5)];
    z2 = [z2; reshape(zeta(2,:,i), 1, 5)];
    z3 = [z3; reshape(zeta(3,:,i), 1, 5)];
    z4 = [z4; reshape(zeta(4,:,i), 1, 5)];
    z5 = [z5; reshape(zeta(5,:,i), 1, 5)];
    T = [T; t(i)];
end

for i = 1 : 10 : length(t_05)
    z1_05 = [z1_05; reshape(zeta05(1,:,i), 1, 5)];
    z2_05 = [z2_05; reshape(zeta05(2,:,i), 1, 5)];
    z3_05 = [z3_05; reshape(zeta05(3,:,i), 1, 5)];
    z4_05 = [z4_05; reshape(zeta05(4,:,i), 1, 5)];
    z5_05 = [z5_05; reshape(zeta05(5,:,i), 1, 5)];
    T_05 = [T_05; t_05(i)];
end

for i = 1 : 10 : length(t_01)
    z1_01 = [z1_01; reshape(zeta01(1,:,i), 1, 5)];
    z2_01 = [z2_01; reshape(zeta01(2,:,i), 1, 5)];
    z3_01 = [z3_01; reshape(zeta01(3,:,i), 1, 5)];
    z4_01 = [z4_01; reshape(zeta01(4,:,i), 1, 5)];
    z5_01 = [z5_01; reshape(zeta01(5,:,i), 1, 5)];
    T_01 = [T_01; t_01(i)];
end
tmin = 0;
tmax = 10;

%%
figure
subplot(3,1,1)
plot(T, [z1(:,5), z2(:,5), z3(:,5), z4(:,5), z5(:,5)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 5 - uz koeficijent pri mjerenju struje agenta 5 k=0.8')
legend('\zeta_{15}', '\zeta_{25}','\zeta_{35}', '\zeta_{45}','\zeta_{55}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%

subplot(3,1,2)
plot(T_05, [z1_05(:,5), z2_05(:,5), z3_05(:,5), z4_05(:,5), z5_05(:,5)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 5 - uz koeficijent pri mjerenju struje agenta 5 k=0.5')
legend('\zeta_{15}', '\zeta_{25}','\zeta_{35}', '\zeta_{45}','\zeta_{55}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
subplot(3,1,3)
plot(T_01, [z1_01(:,5), z2_01(:,5), z3_01(:,5), z4_01(:,5), z5_01(:,5)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 5 - uz koeficijent pri mjerenju struje agenta 5 k=0.1')
legend('\zeta_{15}', '\zeta_{25}','\zeta_{35}', '\zeta_{45}','\zeta_{55}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

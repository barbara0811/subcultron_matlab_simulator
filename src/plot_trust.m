close all

colours = ['r','g','b','m','c','k','k'];
z1 = [];
z2 = [];
z3 = [];
z4 = [];
z5 = [];
T = [];

for i = 1 : 10 : length(t)
    z1 = [z1; reshape(zeta(1,:,i), 1, 5)];
    z2 = [z2; reshape(zeta(2,:,i), 1, 5)];
    z3 = [z3; reshape(zeta(3,:,i), 1, 5)];
    z4 = [z4; reshape(zeta(4,:,i), 1, 5)];
    z5 = [z5; reshape(zeta(5,:,i), 1, 5)];
    T = [T; t(i)];
end

tmin = 0;
tmax = 10;

%%
figure
plot(T, [z1(:,1), z2(:,1), z3(:,1), z4(:,1), z5(:,1)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 1')
legend('\zeta_{11}', '\zeta_{21}','\zeta_{31}', '\zeta_{41}','\zeta_{51}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,2), z2(:,2), z3(:,2), z4(:,2), z5(:,2)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 2')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,3), z2(:,3), z3(:,3), z4(:,3), z5(:,3)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 3')
legend('\zeta_{13}', '\zeta_{23}','\zeta_{33}', '\zeta_{43}','\zeta_{53}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,4), z2(:,4), z3(:,4), z4(:,4), z5(:,4)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 4')
legend('\zeta_{14}', '\zeta_{24}', '\zeta_{34}', '\zeta_{44}', '\zeta_{54}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,5), z2(:,5), z3(:,5), z4(:,5), z5(:,5)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 5')
legend('\zeta_{15}', '\zeta_{25}', '\zeta_{35}', '\zeta_{45}', '\zeta_{55}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

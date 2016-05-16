close all

colours = ['r','g','b','m','c','k','y','w'];
z1 = [];
z2 = [];
z3 = [];
z4 = [];
z5 = [];
z6 = [];
z7 = [];
z8 = [];
T = [];
k=0;
for i = 1 : 10 : length(t)
    k = (i-1)/10 + 1; 
    z1(k,:) = zeta(1,:,i);
    z2(k,:) = zeta(2,:,i);
    z3(k,:) = zeta(3,:,i);
    z4(k,:) = zeta(4,:,i);
    z5(k,:) = zeta(5,:,i);
    z6(k,:) = zeta(6,:,i);
    z7(k,:) = zeta(7,:,i);
    z8(k,:) = zeta(8,:,i);
    T = [T; t(i)];
end
tmin = 0;
tmax =25;

%%
figure
plot(T, [z1(:,1), z2(:,1), z3(:,1), z4(:,1), z5(:,1), z6(:,1), z7(:,1), z8(:,1)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 1')
legend('\zeta_{11}', '\zeta_{21}','\zeta_{31}', '\zeta_{41}','\zeta_{51}','\zeta_{61}','\zeta_{71}','\zeta_{81}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,2), z2(:,2), z3(:,2), z4(:,2), z5(:,2), z6(:,2), z7(:,2), z8(:,2)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 2')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}','\zeta_{62}','\zeta_{72}','\zeta_{82}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,3), z2(:,3), z3(:,3), z4(:,3), z5(:,3), z6(:,3), z7(:,3), z8(:,3)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 3')
legend('\zeta_{13}', '\zeta_{23}','\zeta_{33}', '\zeta_{43}','\zeta_{53}','\zeta_{63}','\zeta_{73}','\zeta_{83}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,4), z2(:,4), z3(:,4), z4(:,4), z5(:,4), z6(:,4), z7(:,4), z8(:,4)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 4')
legend('\zeta_{14}', '\zeta_{24}','\zeta_{34}', '\zeta_{44}','\zeta_{54}','\zeta_{64}','\zeta_{74}','\zeta_{84}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,5), z2(:,5), z3(:,5), z4(:,5), z5(:,5), z6(:,5), z7(:,5), z8(:,5)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 5')
legend('\zeta_{15}', '\zeta_{25}','\zeta_{35}', '\zeta_{45}','\zeta_{55}','\zeta_{65}','\zeta_{75}','\zeta_{85}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,6), z2(:,6), z3(:,6), z4(:,6), z5(:,6), z6(:,6), z7(:,6), z8(:,6)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 6')
legend('\zeta_{16}', '\zeta_{26}','\zeta_{36}', '\zeta_{46}','\zeta_{56}','\zeta_{66}','\zeta_{76}','\zeta_{86}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,7), z2(:,7), z3(:,7), z4(:,7), z5(:,7), z6(:,7), z7(:,7), z8(:,7)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 7')
legend('\zeta_{17}', '\zeta_{27}','\zeta_{37}', '\zeta_{47}','\zeta_{57}','\zeta_{67}','\zeta_{77}','\zeta_{87}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,8), z2(:,8), z3(:,8), z4(:,8), z5(:,8), z6(:,8), z7(:,8), z8(:,8)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 8')
legend('\zeta_{18}', '\zeta_{28}','\zeta_{38}', '\zeta_{48}','\zeta_{58}','\zeta_{68}','\zeta_{78}','\zeta_{88}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

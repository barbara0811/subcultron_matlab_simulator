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
c1 = [];
c2 = [];
c3 = [];
c4 = [];
T = [];
k=0;
for i = 1 : 10 : length(t)
    k = (i-1)/10 + 1; 
    z1(k,:) = zeta(1,:,i);
    z2(k,:) = zeta(2,:,i);
    z3(k,:) = zeta(3,:,i);
    z4(k,:) = zeta(4,:,i);
   % z5(k,:) = zeta(5,:,i);
   % z6(k,:) = zeta(6,:,i);
   % z7(k,:) = zeta(7,:,i);
   % z8(k,:) = zeta(8,:,i);
    c1(k,:)=c_prom(1,:,i);
    c2(k,:)=c_prom(2,:,i);
    c3(k,:)=c_prom(3,:,i);
    c4(k,:)=c_prom(4,:,i);
    a1(k,:)=A_matrica(1,:,i);
    a2(k,:)=A_matrica(2,:,i);
    a3(k,:)=A_matrica(3,:,i);
    a4(k,:)=A_matrica(4,:,i);
    T = [T; t(i)];
end
tmin = 0;
tmax =25;

%%
figure
plot(T, [z1(:,1), z2(:,1), z3(:,1), z4(:,1)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 1')
legend('\zeta_{11}', '\zeta_{21}','\zeta_{31}', '\zeta_{41}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,2), z2(:,2), z3(:,2), z4(:,2)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 2')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,3), z2(:,3), z3(:,3), z4(:,3)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 3')
legend('\zeta_{13}', '\zeta_{23}','\zeta_{33}', '\zeta_{43}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T, [z1(:,4), z2(:,4), z3(:,4), z4(:,4)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 4')
legend('\zeta_{14}', '\zeta_{24}','\zeta_{34}', '\zeta_{44}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T,[c1(:,1),c2(:,1),c3(:,1),c4(:,1)],'LineWidth', 1.25)
grid on 
xlabel('t(s)')
ylabel('delta')
title('Delta prema agentu 1')
legend('\delta_{11}', '\delta_{21}','\delta_{31}', '\delta_{41}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T,[c1(:,2),c2(:,2),c3(:,2),c4(:,2)],'LineWidth', 1.25)
grid on 
xlabel('t(s)')
ylabel('delta')
title('Delta prema agentu 2')
legend('\delta_{12}', '\delta_{22}','\delta_{32}', '\delta_{42}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T,[c1(:,3),c2(:,3),c3(:,3),c4(:,3)],'LineWidth', 1.25)
grid on 
xlabel('t(s)')
ylabel('delta')
title('Delta prema agentu 3')
legend('\delta_{13}', '\delta_{23}','\delta_{33}', '\delta_{43}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T,[c1(:,4),c2(:,4),c3(:,4),c4(:,4)],'LineWidth', 1.25)
grid on 
xlabel('t(s)')
ylabel('delta')
title('Delta prema agentu 4')
legend('\delta_{14}', '\delta_{24}','\delta_{34}', '\delta_{44}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%
figure
plot(T,[a1(:,4),a2(:,4),a3(:,4),a4(:,4)],'LineWidth', 1.25)
grid on 
xlabel('t(s)')
ylabel('A')
title('Susjedi prema agentu 4')
legend('\A_{14}', '\A_{24}','\A_{34}', '\A_{44}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

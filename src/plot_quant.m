close all


tmin = 0;
tmax = 20;

colours = ['r','g','b','m','c','k','k'];
z1 = [];
z2 = [];
z3 = [];
z4 = [];
z5 = [];

z1_quant001 = [];
z2_quant001 = [];
z3_quant001 = [];
z4_quant001 = [];
z5_quant001 = [];

z1_quant005 = [];
z2_quant005 = [];
z3_quant005 = [];
z4_quant005 = [];
z5_quant005 = [];

z1_quant01 = [];
z2_quant01 = [];
z3_quant01 = [];
z4_quant01 = [];
z5_quant01 = [];


z1_quant025 = [];
z2_quant025 = [];
z3_quant025 = [];
z4_quant025 = [];
z5_quant025 = [];


T = [];
T_quant001 = [];
T_quant01 = [];
T_quant005= [];
T_quant025= [];


for i = 1 : 10 : length(t)
    z1 = [z1; reshape(zeta(1,:,i), 1, 5)];
    z2 = [z2; reshape(zeta(2,:,i), 1, 5)];
    z3 = [z3; reshape(zeta(3,:,i), 1, 5)];
    z4 = [z4; reshape(zeta(4,:,i), 1, 5)];
    z5 = [z5; reshape(zeta(5,:,i), 1, 5)];
    T = [T; t(i)];
end


for i = 1 : 10 : length(t)
    z1_quant01 = [z1_quant01; reshape(z_quant01(1,:,i), 1, 5)];
    z2_quant01 = [z2_quant01; reshape(z_quant01(2,:,i), 1, 5)];
    z3_quant01 = [z3_quant01; reshape(z_quant01(3,:,i), 1, 5)];
    z4_quant01 = [z4_quant01; reshape(z_quant01(4,:,i), 1, 5)];
    z5_quant01 = [z5_quant01; reshape(z_quant01(5,:,i), 1, 5)];
    T_quant01 = [T_quant01; t(i)];
end

for i = 1 : 10 : length(t)
    z1_quant025 = [z1_quant025; reshape(z_quant025(1,:,i), 1, 5)];
    z2_quant025 = [z2_quant025; reshape(z_quant025(2,:,i), 1, 5)];
    z3_quant025 = [z3_quant025; reshape(z_quant025(3,:,i), 1, 5)];
    z4_quant025 = [z4_quant025; reshape(z_quant025(4,:,i), 1, 5)];
    z5_quant025 = [z5_quant025; reshape(z_quant025(5,:,i), 1, 5)];
    T_quant025 = [T_quant025; t(i)];
end

%{
for i = 1 : 10 : length(t)
    z1_quant001 = [z1_quant001; reshape(z_quant001(1,:,i), 1, 5)];
    z2_quant001 = [z2_quant001; reshape(z_quant001(2,:,i), 1, 5)];
    z3_quant001 = [z3_quant001; reshape(z_quant001(3,:,i), 1, 5)];
    z4_quant001 = [z4_quant001; reshape(z_quant001(4,:,i), 1, 5)];
    z5_quant001 = [z5_quant001; reshape(z_quant001(5,:,i), 1, 5)];
    T_quant001 = [T_quant001; t(i)];
end


for i = 1 : 10 : length(t)
    z1_quant005 = [z1_quant005; reshape(z_quant005(1,:,i), 1, 5)];
    z2_quant005 = [z2_quant005; reshape(z_quant005(2,:,i), 1, 5)];
    z3_quant005 = [z3_quant005; reshape(z_quant005(3,:,i), 1, 5)];
    z4_quant005 = [z4_quant005; reshape(z_quant005(4,:,i), 1, 5)];
    z5_quant005 = [z5_quant005; reshape(z_quant005(5,:,i), 1, 5)];
    T_quant005 = [T_quant005; t(i)];
end
%}


%% PLOTANJE KONTINUIRANOG I DISKRETIZIRANOG S 0.1
figure
plot(T, [z1(:,1), z2(:,1), z3(:,1), z4(:,1), z5(:,1)], T_quant01, [z1_quant01(:,1), z2_quant01(:,1), z3_quant01(:,1), z4_quant01(:,1), z5_quant01(:,1)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 1 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.1')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%

figure
plot(T, [z1(:,2), z2(:,2), z3(:,2), z4(:,2), z5(:,2)], T_quant01, [z1_quant01(:,2), z2_quant01(:,2), z3_quant01(:,2), z4_quant01(:,2), z5_quant01(:,2)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 2 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.1')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

%%
figure
plot(T, [z1(:,3), z2(:,3), z3(:,3), z4(:,3), z5(:,3)], T_quant01, [z1_quant01(:,3), z2_quant01(:,3), z3_quant01(:,3), z4_quant01(:,3), z5_quant01(:,3)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 3 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.1')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

%%
figure
plot(T, [z1(:,4), z2(:,4), z3(:,4), z4(:,4), z5(:,4)], T_quant01, [z1_quant01(:,4), z2_quant01(:,4), z3_quant01(:,4), z4_quant01(:,4), z5_quant01(:,4)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 4 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.1')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

%%
figure
plot(T, [z1(:,5), z2(:,5), z3(:,5), z4(:,5), z5(:,5)], T_quant01, [z1_quant01(:,5), z2_quant01(:,5), z3_quant01(:,5), z4_quant01(:,5), z5_quant01(:,5)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 5 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.1')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

%{
%% PLOTANJE KONTINUIRANOG I DISKRETIZIRANOG S 0.25
figure
plot(T, [z1(:,1), z2(:,1), z3(:,1), z4(:,1), z5(:,1)], T_quant025, [z1_quant025(:,1), z2_quant025(:,1), z3_quant025(:,1), z4_quant025(:,1), z5_quant025(:,1)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 1 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.25')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%%

figure
plot(T, [z1(:,2), z2(:,2), z3(:,2), z4(:,2), z5(:,2)], T_quant025, [z1_quant025(:,2), z2_quant025(:,2), z3_quant025(:,2), z4_quant025(:,2), z5_quant025(:,2)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 2 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.25')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

%%
figure
plot(T, [z1(:,3), z2(:,3), z3(:,3), z4(:,3), z5(:,3)], T_quant025, [z1_quant025(:,3), z2_quant025(:,3), z3_quant025(:,3), z4_quant025(:,3), z5_quant025(:,3)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 3 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.25')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

%%
figure
plot(T, [z1(:,4), z2(:,4), z3(:,4), z4(:,4), z5(:,4)], T_quant025, [z1_quant025(:,4), z2_quant025(:,4), z3_quant025(:,4), z4_quant025(:,4), z5_quant025(:,4)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 4 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.25')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])

%%
figure
plot(T, [z1(:,5), z2(:,5), z3(:,5), z4(:,5), z5(:,5)], T_quant025, [z1_quant025(:,5), z2_quant025(:,5), z3_quant025(:,5), z4_quant025(:,5), z5_quant025(:,5)],'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 5 - usporedba kontinuiranog povjerenja i diskretiziranog s 0.25')
legend('\zeta_{12}', '\zeta_{22}','\zeta_{32}', '\zeta_{42}','\zeta_{52}', '\zeta_{12}_q', '\zeta_{22}_q','\zeta_{32}_q', '\zeta_{42}_q','\zeta_{52}_q', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
axis([tmin tmax 0 1])
%}

%{
%%
figure
plot(T, [z1(:,1), z2(:,1), z3(:,1), z4(:,1), z5(:,1)], T_quant01, [z1_quant01(:,1), z2_quant01(:,1), z3_quant01(:,1), z4_quant01(:,1), z5_quant01(:,1)],T_quant001, [z1_quant001(:,1), z2_quant001(:,1), z3_quant001(:,1), z4_quant001(:,1), z5_quant001(:,1)],T_quant005, [z1_quant005(:,1), z2_quant005(:,1), z3_quant005(:,1), z4_quant005(:,1), z5_quant005(:,1)]);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 1')
legend('kontinuirano', 'diskretno s 0.01', 'diskretno s 0.1', 'diskretno s 0.05')
axis([tmin tmax 0 1])
%%

figure
plot(T, [z1(:,2), z2(:,2), z3(:,2), z4(:,2), z5(:,2)], T_quant01, [z1_quant01(:,2), z2_quant01(:,2), z3_quant01(:,2), z4_quant01(:,2), z5_quant01(:,2)],T_quant001, [z1_quant001(:,2), z2_quant001(:,2), z3_quant001(:,2), z4_quant001(:,2), z5_quant001(:,2)],T_quant005, [z1_quant005(:,2), z2_quant005(:,2), z3_quant005(:,2), z4_quant005(:,2), z5_quant005(:,2)]);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 2')
legend('kontinuirano', 'diskretno s 0.01', 'diskretno s 0.1', 'diskretno s 0.05')
axis([tmin tmax 0 1])

%%
figure
plot(T, [z1(:,3), z2(:,3), z3(:,3), z4(:,3), z5(:,3)], T_quant01, [z1_quant01(:,3), z2_quant01(:,3), z3_quant01(:,3), z4_quant01(:,3), z5_quant01(:,3)],T_quant001, [z1_quant001(:,3), z2_quant001(:,3), z3_quant001(:,3), z4_quant001(:,3), z5_quant001(:,3)],T_quant005, [z1_quant005(:,3), z2_quant005(:,3), z3_quant005(:,3), z4_quant005(:,3), z5_quant005(:,3)]);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 3')
legend('kontinuirano', 'diskretno s 0.01', 'diskretno s 0.1', 'diskretno s 0.05')
axis([tmin tmax 0 1])

%%
figure
plot(T, [z1(:,4), z2(:,4), z3(:,4), z4(:,4), z5(:,4)], T_quant01, [z1_quant01(:,4), z2_quant01(:,4), z3_quant01(:,4), z4_quant01(:,4), z5_quant01(:,4)],T_quant001, [z1_quant001(:,4), z2_quant001(:,4), z3_quant001(:,4), z4_quant001(:,4), z5_quant001(:,4)],T_quant005, [z1_quant005(:,4), z2_quant005(:,4), z3_quant005(:,4), z4_quant005(:,4), z5_quant005(:,4)]);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 4')
legend('kontinuirano', 'diskretno s 0.01', 'diskretno s 0.1', 'diskretno s 0.05')
axis([tmin tmax 0 1])


%%
figure
plot(T, [z1(:,5), z2(:,5), z3(:,5), z4(:,5), z5(:,5)], T_quant01, [z1_quant01(:,5), z2_quant01(:,5), z3_quant01(:,5), z4_quant01(:,5), z5_quant01(:,5)],T_quant001, [z1_quant001(:,5), z2_quant001(:,5), z3_quant001(:,5), z4_quant001(:,5), z5_quant001(:,5)],T_quant005, [z1_quant005(:,5), z2_quant005(:,5), z3_quant005(:,5), z4_quant005(:,5), z5_quant005(:,5)]);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Povjerenje prema agentu 5')
legend('kontinuirano', 'diskretno s 0.1', 'diskretno s 0.01')
axis([tmin tmax 0 1])
%}
figure
c1=c_prom(1,1,:);
c2=c_prom(2,2,:);
c3=c_prom(3,3,:);
c4=c_prom(4,4,:);
t=linspace(0,12,1201);
plot(t, c1(:,:));
hold on
plot(t, c2(:,:));
hold on
plot(t, c3(:,:));
hold on
plot(t, c4(:,:));
legend('\delta_{1}', '\delta_{2}','\delta_{3}', '\delta_{4}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
%%
figure 
plot(t, c3(:,:),'LineWidth',1.25);
hold on
plot(t, c4(:,:),'Color','y','LineWidth',1.25);
legend('\delta_{3}', '\delta_{4}', 'FontSize', 8, 'Orientation', 'Horizontal', 'Location', 'South')
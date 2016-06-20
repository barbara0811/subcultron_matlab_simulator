close all

colours = ['r','g','b','m','c','k','k'];
z1 = [];
z2 = [];
z3 = [];
z4 = [];
z5 = [];
T = [];

for i = 1 : 10 : length(t)
    z1 = [z1; reshape(novi_clan(1,:,i), 1, 5)];
    z2 = [z2; reshape(novi_clan(2,:,i), 1, 5)];
    z3 = [z3; reshape(novi_clan(3,:,i), 1, 5)];
    z4 = [z4; reshape(novi_clan(4,:,i), 1, 5)];
    z5 = [z5; reshape(novi_clan(5,:,i), 1, 5)];
    T = [T; t(i)];
end

tmin = 0;
tmax = 30;

%%
figure
subplot(3,2,1)
plot(T, [z1(:,1), z2(:,1), z3(:,1), z4(:,1), z5(:,1)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Novi clan prema agentu 1 - tocan agent')
legend('\novi_clan_{11}', '\novi_clan_{21}','\novi_clan_{31}', '\novi_clan_{41}','\novi_clan_{51}', 'FontSize', 8,  'Location', 'Northeast')
axis([tmin tmax 0 1])
%%

subplot(3,2,2)
plot(T, [z1(:,2), z2(:,2), z3(:,2), z4(:,2), z5(:,2)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Novi clan prema agentu 2 - tocan agent')
legend('\novi_clan_{12}', '\novi_clan_{22}','\novi_clan_{32}', '\novi_clan_{42}','\novi_clan_{52}', 'FontSize', 8,  'Location', 'Northeast')
axis([tmin tmax 0 1])
%%

subplot(3,2,3)
plot(T, [z1(:,3), z2(:,3), z3(:,3), z4(:,3), z5(:,3)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Novi clan prema agentu 3 - intruder [0.1 0.5]') 
legend('\novi_clan_{13}', '\novi_clan_{23}','\novi_clan_{33}', '\novi_clan_{43}','\novi_clan_{53}', 'FontSize', 8, 'Location', 'Northeast')
axis([tmin tmax 0 1])
%%

subplot(3,2,4)
plot(T, [z1(:,4), z2(:,4), z3(:,4), z4(:,4), z5(:,4)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Novi clan  prema agentu 4 - intruder [0.1 0.5]')
legend('\novi_clan_{14}', '\novi_clan_{24}', '\novi_clan_{34}', '\novi_clan_{44}', '\novi_clan_{54}', 'FontSize', 8, 'Location', 'Northeast')
axis([tmin tmax 0 1])
%%

subplot(3,2,5)
plot(T, [z1(:,5), z2(:,5), z3(:,5), z4(:,5), z5(:,5)], 'LineWidth', 1.25);
grid on 
xlabel('t(s)')
ylabel('povjerenje')
title('Novi clan prema agentu 5 - intruder [0.1 0.5]')
legend('\novi_clan_{15}', '\novi_clan_{25}', '\novi_clan_{35}', '\novi_clan_{45}', '\novi_clan_{55}', 'FontSize', 8,  'Location', 'Northeast')
axis([tmin tmax 0 1])

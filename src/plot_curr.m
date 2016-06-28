%% PLOTANJE MJERENJA
clc;
close all;
figure

%% plotanje curr_muss
curr_muss1_x = reshape(curr_muss(1,1,:),length(t),1);
curr_muss1_y = reshape(curr_muss(1,2,:),length(t),1);

curr_muss2_x = reshape(curr_muss(2,1,:),length(t),1);
curr_muss2_y = reshape(curr_muss(2,2,:),length(t),1);

curr_muss3_x = reshape(curr_muss(3,1,:),length(t),1);
curr_muss3_y = reshape(curr_muss(3,2,:),length(t),1);

curr_muss4_x = reshape(curr_muss(4,1,:),length(t),1);
curr_muss4_y = reshape(curr_muss(4,2,:),length(t),1);

curr_muss5_x = reshape(curr_muss(5,1,:),length(t),1);
curr_muss5_y = reshape(curr_muss(5,2,:),length(t),1);


title('Current measurements')
subplot(3,5,1)
plot(t, curr_muss1_x, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM X 1')

subplot(3,5,2)
plot(t, curr_muss2_x, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM X 2')

subplot(3,5,3)
plot(t, curr_muss3_x, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM X 3')

subplot(3,5,4)
plot(t, curr_muss4_x, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM X 4')

subplot(3,5,5)
plot(t, curr_muss5_x, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM X 5')


subplot(3,5,6)
plot(t, curr_muss1_y, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM Y 1')

subplot(3,5,7)
plot(t, curr_muss2_y, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM Y 2')

subplot(3,5,8)
plot(t, curr_muss3_y, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM Y 3')

subplot(3,5,9)
plot(t, curr_muss4_y, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM Y 4')

subplot(3,5,10)
plot(t, curr_muss5_y, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrM Y 5')


%% plotanje curr_real
curr_real_x = reshape(curr_real(1,1,:),length(t),1);
curr_real_y = reshape(curr_real(1,2,:),length(t),1);

subplot(3,5,11)
plot(t, curr_real_x, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrR X')

subplot(3,5,12)
plot(t, curr_real_x, 'LineWidth',2)
axis([0,100,0,1])
grid on 
title('CurrR Y')


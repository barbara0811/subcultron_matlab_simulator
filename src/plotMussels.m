%MPos is structure with time that contains aMussels positions
close all;
rng(12);

% read aMussels positions -> CHANGE Mpos TO CORRESPOND TO SIMULATION VARIABLES
n = Mpos.signals.dimensions(2);
x = Mpos.signals.values(1,:,:);
y = Mpos.signals.values(2,:,:);
z = Mpos.signals.values(3,:,:);

f = figure;

% create random RGB and legend item for each aMussel, set max number of
% poits to show
colors = rand(n,3);
for i = 1:n
    h(i) = animatedline('Color',colors(i,:),'LineWidth',2);
    h(i).MaximumNumPoints = 5;
    leg{i} = strcat('M',num2str(i));
end

%set figure info
axis([xmin-10 xmax+10 ymin-10 ymax+10 zmin-5 zmax+5]);
title('t = 0')
xlabel('x[m]');
ylabel('y[m]');
zlabel('z[m]');
legend(leg);
grid on

%drawing
a = tic;
ponder = 1;
for i = 1:length(Mpos.time)
    for j = 1:n
        addpoints(h(j),x(1,j,i),y(1,j,i),z(1,j,i));
    end
    if (i==1)
        drawnow;
    else
        b = toc(a);
        while (b < (Mpos.time(i)-Mpos.time(i-1))*ponder)
            b = toc(a);
        end
        a = tic;
    end
    title(strcat('t = ',num2str(Mpos.time(i)),'s'))
    drawnow
end

%plot A matrix Analysis CHANGE conn TO CORRESPOND TO SIMULATION VARIABLES
conn = conn;
figure
axis auto;
title('Is communication graph connected?')
xlabel('t[s]');
ylabel('True/False');
grid on

plot(conn.time,conn.signals.values,'LineWidth',1.5);
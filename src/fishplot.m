figure(1)
for i=1:n
    plot(xf.signals.values(:,i),yf.signals.values(:,i));
    hold on
end
    grid on 
axis([0 20 0 20])

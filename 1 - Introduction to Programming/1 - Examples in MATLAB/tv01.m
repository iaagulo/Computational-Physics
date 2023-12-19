clear;

g = 9.8; c = 12.5; m = 68.1;
interval = input('What is the time interval?');
t = 0:interval:50;
v(1) = 0;
for k = 1:length(t)-1
    v(k+1) = v(k) + (g - (c/m)*v(k))*(t(k+1) - t(k));
end;
plot(t,(g*m/c)*(1 - exp(-(c/m)*t)),'k')
hold on;
plot(t,v,'r:')
hold off;
title('Dynamics of a Falling Body');
xlabel('Time (seconds)');
ylabel('Terminal Velocity (m/s)');
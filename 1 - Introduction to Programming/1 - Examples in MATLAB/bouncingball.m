clear; clf; clc;

h = 0.01;       % step size
tx = 0:h:400;   % time scale
ty(1) = 0;
vx(1) = 1;      % initial velocity along the x-axis
vy(1) = 0;      % initial velocity along the y-axis
x(1) = 0;       % 
y(1) = 2000;    % initial height of 2000 meters with respect to the ground
g = 9.8;        % acceleration due to gravity

a = y(1); b = vy(1);

count = 0; k = 1;
for i = 2:length(tx)
    k = k + 1;
    ty(i) = ty(i-1) + h;
    x(i) = x(1) + vx(1)*tx(i);
    y(i) = a + b*ty(i) - 0.5*g*ty(i)^2;
    vy(i) = b - g*ty(i);
    if y(i) <= 0
        a = 0; b = -0.9*vy(i); ty(i) = 0;
        count = count + 1;
        if count == 10
            break;
        end;
    end;
end;

figure(1); plot(x,y);
title('Trajectory of the Bouncing Ball');
xlabel('Horizontal Displacement, meters');
ylabel('Height, meters');
ylim([0 2100])

figure(2); plot(tx(1:k),vy);
title('Velocity of the Bouncing Ball');
xlabel('Time, seconds');
ylabel('Height, meters');

z = zeros(1,length(t));

figure(3);
j = 1;
for i = 1:50:length(t)
    plot(t,y); hold on;
    k = plot(t(i),y(i),'ro','MarkerFaceColor','r'); hold off;
    set(k,'XData',t(i),'YData',y(i),'MarkerSize',12)
    axis([0 75 -10 110]);
        line(t,z)
    M(j) = getframe;
    j = j + 1;
end;
movie(M,2,15)
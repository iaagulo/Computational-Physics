clear; clf; clc;

h = 0.5;
x = 0:h:360;
y(1) = 0;
for i = 2:length(x)
    k1(i) = dydx( x(i-1),y(i-1) );
    k2(i) = dydx( x(i-1) + 0.5*h, y(i-1) + 0.5*k1*h );
    k3(i) = dydx( x(i-1) + 0.5*h, y(i-1) + 0.5*k2*h );
    k4(i) = dydx( x(i-1) + h, y(i-1) + k3*h );
    y(i) = y(i-1) + (1/6)*(k1(i) + 2*k2(i) + 2*k3(i) + k4(i))*h;
end;
plot(x,y,'LineWidth',3)
hold on
%plot(x,-0.5*x.^4+4*x.^3-10*x.^2+8.5*x+1,'r')
plot(x,(180/pi)*sin(x*pi/180),'r');
hold off


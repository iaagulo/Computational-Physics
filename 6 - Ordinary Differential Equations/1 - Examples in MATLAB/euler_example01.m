clear; clc; clf;

%% analytical solution
xtrue = linspace(0,4);
ytrue = -0.5*xtrue.^4 + 4*xtrue.^3 -10*xtrue.^2 +8.5*xtrue + 1;
plot(xtrue,ytrue,'LineWidth',5);
hold on;
grid on;

%% this is where we use Euler's method
%% to solve for y
h = 0.5;       % step size
xmin = 0;
xmax = 4;
interval = 1 + (xmax - xmin)/h;
x = linspace(xmin,xmax,interval);
y = zeros(1,length(x));         % initialize y
y(1) = 1;       % boundary condition
for i = 1:length(x)-1
    y( i+1 ) = y( i ) + f( x(i) )*h;
end
plot(x,y,'o','MarkerSize',10,'MarkerFaceColor','r');
legend({'Analytical Solution','Numerical Solution'},'Location','northwest');
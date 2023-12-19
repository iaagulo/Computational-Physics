clear

x = 0:0.1:2*pi;
y = sin(x);
plot(x,y)
xlim([x(1) x(length(x))])
grid on
%%
trapz(x,y)
%%
yint = cumtrapz(y)
hold on
plot(x,yint/abs(max(yint)))
grid on
hold off
%%
syms m n p

n = @(m) sin(m)
p = integral(n,0,2*pi)
%%
plot(x,double(n(x)))
xlim([x(1) x(length(x))])
grid on
hold on
plot(x,double(p))
hold off
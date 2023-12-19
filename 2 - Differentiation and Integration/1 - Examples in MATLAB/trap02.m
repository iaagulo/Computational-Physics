%% this program plots the graphical interpretation of the integral using
%% Trapezoidal rule for one interval

clear;

%% the limits of integration
a = 0; b = 0.8;
%% the number of intervals
n = 2;
%% the size of each interval
h = ( b - a )/n;
%% range of x with step size 0.01
x = a:0.2:b;
%% computes for the given function for each x
f = 400*x.^5 - 900*x.^4 + 675*x.^3 - 200*x.^2 + 25*x + 0.2;
%% computes for the integrand for each interval for all x
j = 0;
for i = 1:length(x)
    c = j*round( length(x)/n ) + 1;
    d = (j+1)*round( length(x)/n );
    fy(i) = f(c) + ( x(i) - x(c) )*( f(d) -  f(c+1) )/( x(d) - x(c+1) );
    if x(i) == x(d)
        j = j + 1; 
    end;
end;
%% plots both the given function and the integrand
plot (x,f,x,fy,'LineWidth',3);
title ('Trapezoidal Rule with h=0.8','FontSize',15);
xlabel('x','FontSize',15);
ylabel('f(x)','FontSize',15);
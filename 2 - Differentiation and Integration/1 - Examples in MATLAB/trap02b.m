%% this program plots the graphical interpretation of the integral using
%% Trapezoidal rule for one interval

clear;

%% the limits of integration
a = 0; b = 0.8;
%% the number of intervals
n = 10;
%% the size of each interval
h = ( b - a )/n;
%% number of points within an interval
step = 100;
%% number of data points
z = b*step/h + 1;
%% computes for the integrand for each interval for all x
j = 0;
for i = 1:z
    c = j*round( z/n ) + 1;
    d = (j+1)*round( z/n );
    fy(i) = f( x(h/step,c) ) + ( x(h/step,i) - x(h/step,c) )*( f( x(h/step,d) ) -  f( x(h/step,c) ) )/( x(h/step,d) - x(h/step,c) );
    if x(h/step,i) == x(h/step,d)
        j = j + 1; 
    end;
end;

%% generates x and f values
for i = 1:z
    ex(i) = x(h/step,i);
    ef(i) = f( ex(i) );
end;
%% plots both the given function and the integrand
plot (ex,ef,ex,fy,'LineWidth',3);

exx = a:h:b;
eff = 400*exx.^5 - 900*exx.^4 + 675*exx.^3 - 200*exx.^2 + 25*exx + 0.2;
sum = 0;
for i = 2:n
    sum = sum + eff(i);
end;
intg = h*( eff(1) + 2*sum + eff(n+1) )/2;

title (['Trapezoidal Rule with h=',num2str(h),'    I=',num2str(intg)],'FontSize',15);
xlabel('x','FontSize',15);
ylabel('f(x)','FontSize',15);
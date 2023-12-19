clear; clc;

x = 0;
h = 3*pi/5 - pi/2;

for i = 1:2:111
    y = x;
    % cos(3*pi/5) indices must be odd and have a stepsize of 2
    x = x - ((-1)^((i-1)/2))*(h^i)/factorial(i);
    
    % sin(3*pi/5) indices must be even and have a stepsize of 2
    % x = x + (-1)^((i)/2)*(h^i)/factorial(i);
    error = abs(x - y);
    if error < 1e-12
        break;
    end
    % error = 100*abs( (cos(3*pi/5) - x)/cos(3*pi/5) )
end
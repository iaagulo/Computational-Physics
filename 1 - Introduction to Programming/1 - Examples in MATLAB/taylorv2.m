clear; clc;

x = 0; y = 0; i = 1;
h = 3*pi/5 - pi/2;

error = 1;
while error > 1e-12
    % cos(3*pi/5) indices must be odd and have a stepsize of 2
    x = x - ((-1)^((i-1)/2))*(h^i)/factorial(i);
    
    % sin(3*pi/5) indices must be even and have a stepsize of 2
    % x = x + (-1)^((i)/2)*(h^i)/factorial(i);
    error = abs(x - y);
    y = x;
    i = i + 2;
end

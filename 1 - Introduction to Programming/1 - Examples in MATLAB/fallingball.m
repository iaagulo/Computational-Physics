clear; clc;

i = 1;
for t = 0:20
    y = 2000 - 0.5*9.8*t^2;
    plot(0,y,'ro','MarkerFaceColor','r');
    axis([-1 1 0 2000]);
    M(i) = getframe;
    i = i + 1;
end;
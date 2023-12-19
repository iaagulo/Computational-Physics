clear; clf;

t = 0:0.1:10;
x = 0:(1/pi):4*pi;
j = 1;
for i = 1:length(t)
    y = sin(x-t(i));
    %pause(1);
    plot(x,y);
    M(j) = getframe;
    j = j + 1;
end;

movie(M,1,15)

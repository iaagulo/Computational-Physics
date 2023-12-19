clear; clf; clc;

h = 0.1;
tx = 0:h:7500;
ty(1) = 0;
xo = 0; x(1) = xo;
yo = 2000; y(1) = yo;
vox = 1; vx(1) = vox;
voy = 0; vy(1) = voy;
g = 9.8;

count = 0;
for i = 2:length(tx)
    ty(i) = ty(i-1) + h;
    x(i) = xo + vox*tx(i);
    y(i) = yo + voy*ty(i) - 0.5*g*ty(i)^2;
    vy(i) = voy - g*ty(i);
    if y(i) <= 0
        yo = 0; voy = -0.7*vy(i); ty(i)=0;
        count = count + 1;
        if count == 10
            break;
        end;
    end;
end;

plot(x,y)
%ylim([0 2100])
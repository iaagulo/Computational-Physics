clear; clf;

x1 = 4; y1 = 6; 
x2 = 8; y2 = 6;

for a = 0:11
    for b = 0:11
        x(a+1,b+1) = a; y(a+1,b+1) = b;
        Ex(a+1,b+1,1) = (a - x1)/( (a - x1)^2 + (b - y1)^2 ) + (a - x2)/( (a - x1)^2 + (b - y1)^2 );
        Ey(a+1,b+1,1) = (b - x1)/( (a - x1)^2 + (b - y1)^2 ) + (b - x2)/( (a - x1)^2 + (b - y1)^2 );
        theta = acos( Ey(a+1,b+1,1)/Ex(a+1,b+1,1) );
    end;
end;

quiver(x,y,Ex,Ey);
%Ez = zeros(size(Ex)); z = zeros(size(x));

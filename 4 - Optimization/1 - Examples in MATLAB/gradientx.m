clear; clc;

x = -1.5:0.1:2.5;
y = -1.5:0.1:2.5;
z = zeros( length(x),length(y) );
for i = 1:length(x)
    for j = 1:length(y)
        z(i,j) = f(x(i),y(j));
    end
end

figure(1);
contour(x,y,z,20,'LineWidth',3); grid on;
% surfc(x,y,z);
hold on;
plot(-1,1,'ko',2,1,'ro','LineWidth',5);
F(1) = getframe;

n = 60;
xinit = -1;
yinit = 1;
quiver(xinit,yinit,0.6,-0.6,'k','LineWidth',5);
step = 0.1;
dataf = zeros( length(n) );
gradx = zeros( length(n) );
grady = zeros( length(n) );
xnew = zeros( length(n) );
ynew = zeros( length(n) );



for i = 1:n-1
    dataf(i) = f(xinit,yinit);
    [gradx(i),grady(i)] = grad(xinit,yinit);

    [xnew(i+1),ynew(i+1)] = newval(xinit,yinit,gradx(i),grady(i),step);
    xinit = xnew(i+1);
    yinit = ynew(i+1);
end
dataf = [dataf 0];
gradx = [gradx 0];
grady = [grady 0];
xnew = [-1 xnew(2:n)];
ynew = [1 ynew(2:n)];



new = [xnew; ynew; dataf; gradx; grady];

for i = 2:n
    quiver(xnew(i),ynew(i),gradx(i)*step,grady(i)*step,'k','LineWidth',5);
    F(i) = getframe;
end
% quiver3(-1,1,f(-1,1),0.6,-0.6,f(-1+0.6,1+(-0.6))-f(-1,1),'k','LineWidth',5);
hold off;

movie(F,1,5);
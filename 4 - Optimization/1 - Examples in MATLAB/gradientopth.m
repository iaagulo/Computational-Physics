clear; clc;

x = -1.5:0.1:2.5;
y = -1.5:0.1:2.5;
z = zeros( length(x),length(y) );
for i = 1:length(x)
    for j = 1:length(y)
        z(i,j) = f(x(i),y(j));
    end
end

figure(2);
contour(x,y,z,30,'LineWidth',3); grid on;
% surfc(x,y,z);
hold on;
plot(-1,1,'ko',2,1,'ro','LineWidth',5);
G(1) = getframe;

n = 20;
xinit = -1;
yinit = 1;
quiver(xinit,yinit,0.6,-0.6,'b','LineWidth',5);

dataf = zeros( length(n) );
gradx = zeros( length(n) );
grady = zeros( length(n) );
newx = zeros( length(n) );
newy = zeros( length(n) );
h = zeros( length(n) );
yout = zeros( length(n) );

for i = 1:n-1
    dataf(i) = f(xinit,yinit);
    [gradx(i),grady(i)] = grad(xinit,yinit);
    [h(i),yout(i)] = randomtest(xinit,yinit,gradx(i),grady(i));
    [newx(i+1),newy(i+1)] = newval(xinit,yinit,gradx(i),grady(i),h(i));
    xinit = newx(i+1);
    yinit = newy(i+1);
end
dataf = [dataf 0];
gradx = [gradx 0];
grady = [grady 0];
newx = [-1 newx(2:n)];
newy = [1 newy(2:n)];
h = [h 0];
yout = [yout 0];

new = [newx; newy; dataf; gradx; grady; h; yout];

for i = 2:n
    quiver(newx(i),newy(i),gradx(i)*h(i),grady(i)*h(i),'b','LineWidth',5);
    G(i) = getframe;
end
% quiver3(-1,1,f(-1,1),0.6,-0.6,f(-1+0.6,1+(-0.6))-f(-1,1),'k','LineWidth',5);
hold off;

movie(G,1,5);
clear; clf;

length=1.5;
t=-length*pi:(1/(pi)):length*pi;
del=1; dur=1; i = 2;

%surf(t,t,sin(t-i/del)'*cos(t-i/del));
%mesh(t,t,sin(t-i/del)'*cos(t-i/del));
%contour(t,t,sin(t-i/del)'*cos(t-i/del));
%surfc(t,t,sin(t-i/del)'*cos(t-i/del));
plot3(t,t,sin(t-i/del)'*cos(t-i/del));
axis([-length*pi length*pi -length*pi length*pi -3 3])
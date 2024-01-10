function [newx,newy] = newval(x,y,dfdx,dfdy,h)

newx = x + dfdx*h;
newy = y + dfdy*h;

end
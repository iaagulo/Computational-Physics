function [dfdx,dfdy] = grad(x,y)

dfdx = 2*y + 2 - 2*x;
dfdy = 2*x - 4*y;

end
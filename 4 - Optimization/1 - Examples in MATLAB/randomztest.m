function [hout,yout, i] = randomztest(z,xo,yo,gradx,grady)

    iter = 1e4;
    ytest = 0;
    for i = 1:iter
        h = rand();
        y = z(xo - gradx*h,yo - grady*h);
        if y < ytest
            ytest = y;
            hopt = h;
        end
    end

    hout = hopt;
    yout = ytest;

end
function yout = myode(x,y)
    yout(1) = y;
    h = x(2) - x(1);
    for i = 1:length(x)-1
        k1 = f( x(i), yout(i) );
        k2 = f( x(i)+0.5*h, yout(i)+0.5*k1*h );
        k3 = f( x(i)+0.5*h, yout(i)+0.5*k2*h );
        k4 = f( x(i)+h, yout(i)+k3*h );
        yout(i+1) = yout(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h;
    end
end
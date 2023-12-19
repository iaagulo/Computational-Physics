clear;

%x = 0;
%y = 6;
%T = 2*x*y + 2*x - x^2 - 2*y^2 + 72

n = 8; % can only be an even number
x = 0:8/n:8;
y = 0:6/n:6;
for ix = 1:n+1
    for iy = 1:n+1
        T(ix,iy) = 2*x(ix)*y(iy) + 2*x(ix) - x(ix)^2 - 2*y(iy)^2 + 72;
    end;
end;    

mesh(x,y,T)

% integrating first along the x
for i = 1:n+1
    sum1 = 0;
    for j = 2:2:n
        sum1 = sum1 + T(j,i);
    end;
    sum2 = 0;
    for j = 3:2:n-1
        sum2 = sum2 + T(j,i);
    end;
    Tx(i) = 8*( T(1,i) + 4*sum1 + 2*sum2 + T(n+1,i) )/(3*n);
end;

% integrating along the y
sum3 = 0;
for j = 2:2:n
    sum3 = sum3 + Tx(j);
end;
sum4 = 0;
for j = 3:2:n-1
    sum4 = sum4 + Tx(j);
end;
I = 6*( Tx(1) + 4*sum3 + 2*sum4 + Tx(n+1) )/(3*n);

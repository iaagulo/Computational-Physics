function qy = cubint(x,y,qx)
%Input data set x and y and query points qx
%Returns interpolated values qy 

    n = length(x);
    Adum = zeros((n-2),n);
    C = zeros((n-2),1);

    for i = 2:n-1
    %Matrix A
        Adum(i-1,i-1) = x(i)-x(i-1);
        Adum(i-1,i) = 2*(x(i+1)-x(i-1));
        Adum(i-1,i+1) = x(i+1)-x(i);
    %Matrix C
        e1 = (6/(x(i+1)-x(i)))*(y(i+1)-y(i));
        e2 = (6/(x(i)-x(i-1)))*(y(i-1)-y(i));
        C(i-1,1) = e1+e2;
    end
    A = Adum;
    A(:,1) = [];
    A(:,(n-1)) = [];

    %Matrix B
    Bdum = (inv(A))*C;
    B(1,1) = 0;
    B = [B;Bdum];
    B(n,1) = 0;
    
    qy = zeros(size(qx,1),size(qx,2));
    k = 1;
    for i = 2:length(x)
        while ( qx(k) < x(i) )
            den = x(i)-x(i-1);
            term1 = ( B(i-1)/(6*den) )*( x(i) - qx(k) )^3;
            term2 = ( B(i)/(6*den) )*( qx(k) - x(i-1) )^3;
            term3 = ( y(i-1)/den - B(i-1)*den/6 )*( x(i) - qx(k) );
            term4 = ( y(i)/den - B(i)*den/6 )*( qx(k) - x(i-1) );
            qy(k) = term1 + term2 + term3 + term4;
            k = k + 1;
        end
    end
end


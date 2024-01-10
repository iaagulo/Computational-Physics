function B = regre(x,y,m)
%[ds,s] = regre(x,y,m)
%Input 2xn data set (x,y) and polynomial order (m)
%Returns a 1x(m+1) data set (B) and standard deviation (s)

%Matrix A
A = zeros(m+1);
for i = 1:m+1
    for j = 1:m+1
        A(i,j) = sum((x.^(i+j-2)));
    end
end

%Matrix C
C = zeros((m+1),1);
for i = 1:m+1
    C(i,1) = sum((x.^(i-1).*y));
end

%Matrix B
B = (inv(A))*C;

end

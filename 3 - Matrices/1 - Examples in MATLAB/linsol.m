function [L,U,x] = linsol(a,b)	%% CREATES A FUNCTION NAMED ‘linsol’ WITH INPUT
                                %% PARAMETERS a and b. a IS AN n x n MATRIX. 
                                %% b IS A n x 1 MATRIX
n = length(a);                  %% TAKES THE DIMENSION OF THE n x n MATRIX
L = eye(n,n);                   %% PRODUCES AN n x n UNITY MATRIX
U = zeros(n,n);                 %% PRODUCES AN n x n MATRIX W/ ALL ELEMENTS EQUAL TO ZERO

for k = 1:n-1                   %% CODE THAT GENERATES THE L AND THE U MATRICES
  for i = k+1:n
    f = a(i,k)/a(k,k);
    a(i,k) = f;
    for j = k+1:n
      a(i,j) = a(i,j) - f*a(k,j);
    end;
  end;
end;

for i = 1:n
  for j = i:n
    U(i,j) = a(i,j);
  end;
end;
for i = 2:n
  for j = 1:i-1
    L(i,j) = a(i,j);
  end;
end;

for i = 1:n                     %% CODE THAT GENERATES THE MATRIX ELEMENTS OF MATRIX d
  summ = 0;                     %% USING FORWARD SUBSTITUTION
  for j = 1:i-1
    summ = summ + a(i,j)*d(j);
  end;
  d(i) = b(i) - summ;
end;

x(n) = d(n)/a(n,n);
for i = n-1:-1:1				%% CODE THAT GENERATES THE MATRIX ELEMENTS OF MATRIX b
  summ = 0;                     %% USING BACKWARD SUBSTITUTION
  for j = i+1:n
    summ = summ + a(i,j)*x(j);
  end;
  x(i) = (d(i) - summ)/a(i,i);
end;

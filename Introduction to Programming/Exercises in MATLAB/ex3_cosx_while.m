% This program computes for the cosine of x
% with tolerance
x = pi; y = 0; i = 0; tol = 1e-10;
error = abs( ((cos(x)-y)/cos(x))*100 );
while error > tol,
  k=1; 
  for j = 1:2*i, % This part of the program
    k=k*j;       % computes for the factorial
  end;           % of 2*n
  y = y + ((-1)^i)*(x^(2*i))/k;
  error = abs( ((cos(x)-y)/cos(x))*100 );
  i = i + 1;
end;
k  % displays the value of k
y  % displays the value of cos(x)
error, i
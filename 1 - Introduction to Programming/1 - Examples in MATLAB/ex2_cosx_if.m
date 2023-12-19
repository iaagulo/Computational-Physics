% This program computes for the cosine of x
% with tolerance
x = pi; y = 0; tol = 1e-4;
for i = 0:100 
  k=1; 
  for j = 1:2*i, % This part of the program
    k=k*j;       % computes for the factorial
  end;           % of 2*n
  y = y + ((-1)^i)*(x^(2*i))/k;
  error = abs( ((cos(x)-y)/cos(x))*100 );
  if (error < tol), break, end;
end;
k  % displays the value of k
y  % displays the value of cos(x)
error, i
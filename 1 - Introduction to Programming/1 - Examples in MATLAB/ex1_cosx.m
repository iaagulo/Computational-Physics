% This program computes for the cosine of x
% using the power series expansion
n = input('How many terms? '); x = pi; y = 0;
for i = 0:n 
  k=1; 
  for j = 1:2*i  % This part of the program
    k=k*j;       % computes for the factorial
  end           % of 2*n
  y = y + ((-1)^i)*(x^(2*i))/k; 
end
k;  % displays the value of k
y;  % displays the value of cos(x)
error = ((cos(x)-y)/cos(x))*100;
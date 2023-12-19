clear; clc;

% note that if t = 0:0.1*tau:6*tau, the expression inside the
% exponential becomes -(0:0.1*tau:6*tau)/tau or 0:0.1:6. thus, the variable
% t may be defined in this way without defining tau.
h = 0.1;   % this is the step size
t = 0:h:6;

% since you only need to plot q(t)/CVs, the expression to be used is then
q = 1 - exp( -t );
subplot(2,1,1); plot(t,q);

% to use numerical derivative, you may use either of the two methods
% described below.
% METHOD 1.
%for i = 1:length(t)-1       % first forward divided difference
%    t1(i) = t(i);
%    dqdtn(i) = ( q(i+1) - q(i) )/h;% + exp( -t(i) )*h/2;
%end

%for i = length(t):-1:2       % first backward divided difference
%    t1(i) = t(i);
%   dqdtn(i) = ( q(i) - q(i-1) )/h - exp( -t(i) )*h/2;
%end

%for i = 2:length(t)-1       % centered divided difference
%    t1(i) = t(i);
%    dqdtn(i) = ( q(i+1) - q(i-1) )/(2*h) + exp( -t(i) )*h^2/factorial(3);
%end


% METHOD 2.

% first forward divided difference
dqdtn = ( ( 1 - exp( -(t+h) ) ) - (1 - exp( -t )) )/h + exp( -t )*h/2;

% first backward divided difference
%dqdtn = ( ( 1 - exp( -t ) ) - (1 - exp( -(t-h) )) )/h - exp( -t )*h/2;

% centered divided difference
%dqdtn = ( ( 1 - exp( -(t+h) ) ) - (1 - exp( -(t-h) )) )/(2*h) + exp( -t )*h^2/factorial(3);

%subplot(2,1,2); plot(t1,dqdtn);  % for METHOD 1
dqdta = exp( -t );
subplot(2,1,2); 
plot(t,dqdtn,'o',t,dqdta,'*');   % for METHOD 2
legend('Numerical','Analytical');
%hold on;
%plot(t,dqdta,'r');
%hold off;














%% Analyzing Jump Forces
% In this machine problem, you are going to be given two sets of data, which 
% you need to analyze. The data were both obtained from measuring the normal and 
% parallel forces involved in a jump. These forces were measured by a force plate 
% as shown in the video. Both data measured force vs time.
% 
% Your task is to integrate a select portion of the plot and interpret what 
% the resulting value is and what it represents. 
% 
% First, you need to clear the workspace of any existing variables. Do this 
% in the field below.

clear
% TASK 1. Import the Data Sets
% In the field below, import the normal force data to the variable $Fn$. 

Fn = importdata("normal.txt")
%% 
% Take a look at the workspace. Notice that the variable $Fn$ is NOT a struct 
% variable, but is simply a matrix with $n$ $x$ $m$ dimensions. Whenever you import 
% data, you always have to check whether what you import is a struct or a matrix.
% 
% Assign the first column of the variable $Fn$, i.e. the time data, and the 
% second column of the variable $Fn$, i.e., the normal force data, to the variables 
% $tn$ and $fn$, respectively.

tn = Fn(:,1)
fn = Fn(:,2)
%% 
% Import the parallel force data to the variable $Fp$. Assign the first column 
% of the variable $Fp$, i.e. the time data, and the second column of the variable 
% $Fp$, i.e., the normal force data, to the variables $tp$ and $fp$, respectively.

Fp = importdata("parallel.txt")
tp = Fp(:,1)
fp = Fp(:,2)
% TASK 2. Plot the data set in one graph.
% You are now going to plot the data in one graph. This means that you will 
% need to use the $subplot()$ command. Make a graph that has two rows and column 
% of plots. 
% 
% In the top row, plot the normal force vs time. In the bottom row, plot the 
% parallel force vs time. Use black circles and solid lines as markers. Add titles 
% and label the x- and y-axes. You may choose the font sizes. The unit of time 
% is milliseconds. So, all of these are happening in a fraction of a second.

subplot(2,1,1); 
plot(tn, fn,'ko-')
title('Normal force of a jump as a function of time','FontSize',15);
xlabel('time (milliseconds)','FontSize',15);
ylabel('Normal force (Newtons)','FontSize',15);
% xlim([tn(1) tn(length(tn))]);
subplot(2,1,2); 
plot(tp, fp,'ko-')
title('Parallel force of a jump as a function of time','FontSize',15);
xlabel('time (milliseconds)','FontSize',15);
ylabel('Parallel force (Newtons)','FontSize',15);
% xlim([tp(1) tp(length(tp))]);
% TASK 3. Input the limits of integration
% In this task, you are going to ask the user to input the limits of integration. 
% Assign the variables $lowerlim$ and $upperlim$ to be the lower and upper limits 
% of integration. Obviously, since this is going to be an integral with respect 
% to time, then the lower and upper limits of integration must be time units and 
% in increments of 0.1 seconds.
% 
% Using the $input()$ command, use the prompt "Input the lower limit of integration: 
% " to ask the user for the lower limit and assign the value to the variable $lowerlim$. 
% When you run this section, you need to go to the command window to type in the 
% numerical values.

lowerlim = input('Input lower limit of integration: ');    
%% 
% Using the $input()$ command, use the prompt "Input the upper limit of integration: 
% " to ask the user for the upper limit and assign the value to the variable $upperlim$.

upperlim = input('Input upper limit of integration: ');
% TASK 4. Find the index corresponding to the limits of integration
% Since the numerical input will be a time variable, then in order to find the 
% corresponding force, we need to find the corresponding index of the time.
% 
% Use the $find()$ command to find the index corresponding to when $tn$ is equal 
% to the value of the $lowerlim$. Assign this index to the variable $lowerval$.

lowerval = find(tn == lowerlim);
%% 
% Display the value of the normal and parallel forces corresponding to the lower 
% limit of integration.

fn(lowerval)
fp(lowerval)
%% 
% Similarly, use the $find()$ command to find the index corresponding to when 
% $tn$ is equal to the value of the $upperlim$. Assign this index to the variable 
% $upperval$.

upperval = find(tn == upperlim);
%% 
% Display the value of the normal and parallel forces corresponding to the lower 
% limit of integration.

fn(upperval)
fp(upperval)
% TASK 5. Replot both graphs to cover only the limits of integration
% You are now going to replot the data in one graph showing only the time limits 
% of integration. Using the $subplot()$ command, make a graph that has two rows 
% and column of plots. 
% 
% In the top row, plot the normal force vs time. In the bottow row, plot the 
% parallel force vs time. Use black circles and solid lines as markers. Add titles 
% and label the x- and y-axes. You may choose the font sizes.

subplot(2,1,1); 
plot(tn(lowerval:upperval), fn(lowerval:upperval),'ko-')
title('Normal force of a jump as a function of time','FontSize',15);
xlabel('time (milliseconds)','FontSize',15);
ylabel('Normal force (Newtons)','FontSize',15);
% xlim([tn(1) tn(length(tn))]);
subplot(2,1,2); 
plot(tp(lowerval:upperval), fp(lowerval:upperval),'ko-')
title('Parallel force of a jump as a function of time','FontSize',15);
xlabel('time (milliseconds)','FontSize',15);
ylabel('Parallel force (Newtons)','FontSize',15);
% xlim([tp(1) tp(length(tp))]);
% TASK 6. Implementing Simpson's 1/3 rule
% Use Simpson's 1/3 rule to solve for the integral of the normal force vs time 
% curve over the selected limits of integration. Simpson's 1/3 rule is written 
% as
% 
% $$I=2h\frac{f\left(x_1 \right)+4f\left(x_2 \right)+f\left(x_3 \right)}{6}+\frac{f\left(x_3 
% \right)+4f\left(x_4 \right)+f\left(x_5 \right)}{6}+\ldotp \ldotp \ldotp +\frac{f\left(x_{n-2} 
% \right)+4f\left(x_{n-1} \right)+f\left(x_n \right)}{6}$$
% 
% or
% 
% $$I=2h\frac{f\left(x_1 \right)+4\sum_{j=2,4,6,\ldotp \ldotp }^{n-1} f\left(x_i 
% \right)+2\sum_{j=3,5,7,\ldotp \ldotp \ldotp }^{n-2} f\left(x_j \right)+f\left(x_n 
% \right)}{6}$$
% 
% Immediately from the first equation, we see that it's going to be a problem, 
% if there are even number of data points. Thus, your code must be able to take 
% into account both even and odd number of data points. If the number of data 
% points is even, consider summing only $n-1$ data points with the Simpson's 1/3 
% rule. Then when everything is summed up, just add the $n^{th$ data point to 
% the sum. 
% 
% Create a function called $mysimpson()$ that implements Simpson's 1/3 rule. 
% This function must take in as its first argument the mathematical function that 
% will be integrated and the step size of the $x-$data set. In the field below, 
% type down the correct commands that use your MATLAB function to solve for the 
% integral of the normal force vs time curve and the parallel force vs time curve 
% over the selected limits of integration determined from Task 3. Assign their 
% respective output values to the variables $fnor$ and $fpar$, and display them 
% in the right pane.

h = 0.1;
fnor = mysimpsons( fn(lowerval:upperval), h )
trapz( tn(lowerval:upperval), fn(lowerval:upperval) )
fpar = mysimpsons( fp(lowerval:upperval), h )

%% 
% To display the results in the command window or in the right pane, you can 
% do this.

X = ['The integrated value of the normal and perpendicular forces with respect to time are ',...
        num2str(fnor), ' Newton-seconds and ', num2str(fpar),...
        ' Newton-seconds, respectively.'];
disp(X)
%% 
% Explain the physical meaning of these numbers.

% Write your answer here:
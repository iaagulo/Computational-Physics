function [xopt, yopt] = optimquadintfun(f,x,tol)
    % This is an optimum problem solve for continuos functions
    % The three initial guesses are x(1), x(2), x(3).
    
    % Counts the number of input arguments and
    % uses the default value if there is no 
    % fourth input argument
    if nargin < 3
        tol = 0.01;
    end
    
    % initialize x3 and ensures that tolerance will not be
    % achieved in the first iteration
    x3 = 4*x(3);

    while or( abs(x3-x(1))>tol, abs(x3-x(3))>tol )
        
        %Solving for x3
        x3 = 0.5*( f(x(1))*(x(2)^2 - x(3)^2) + f(x(2))*(x(3)^2 - x(1)^2) + f(x(3))*(x(1)^2 - x(2)^2) )...
        /( f(x(1))*(x(2) - x(3)) + f(x(2))*(x(3) - x(1)) + f(x(3))*(x(1) - x(2)) );
    
        % append new value x3 to the array guess x
        testarray = [x x3];
        % sort testarry from lowest to highest 
        % and assign to variable sortarray
        sortarray = sort(testarray);
    
        % if the first values of the variables testarray
        % and the sortarray are the same, remove these values
        % and assign the remaining numbers in sortarray as the
        % new guesses to the variable x
        if testarray(1) == sortarray(1)
            x = sortarray(2:4);
        % if the last values of the variables testarray
        % and the sortarray are the same, remove these values
        % and assign the remaining numbers in sortarray as the
        % new guesses to the variable x
        elseif testarray(3) == sortarray(4)
            x = sortarray(1:3);
        end

    end
    
    xopt = x3;
    yopt = f(xopt);

end
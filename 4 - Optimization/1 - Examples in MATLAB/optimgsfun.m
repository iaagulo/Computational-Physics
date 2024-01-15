function [xopt, yopt] = optimgsfun(f,xl,xu,tol)
    % This is an optimum problem solve for continuos functions
    
%     hold on
    R = ( sqrt(5) - 1 )/2;
    
    % Counts the number of input arguments and
    % uses the default value if there is no 
    % fourth input argument
    if nargin < 4
        tol = 0.01;
    end
    d = R*(xu - xl);
    x1 = xl + d;
    
    % Line 21 belows sets the default setting to 
    % look for the maximum value if there are two
    % optimum values within the given range. If you
    % want to change the default setting to look for
    % the minimum value instead, change '<' to '>'.
    if f(xu) < f(x1)        % looking for maximum
        while ( abs((xu - xl)/xl) > tol )
            d = R*(xu - xl);
            x1 = xl + d;
            x2 = xu - d;
            if f(x1) > f(x2)
                xl = x2;
            else
                xu = x1;
            end
%             plot(xu,f(xu),'ro','MarkerSize',5,'LineWidth',5);
        end
    else                    % looking for minimum
        while ( abs((xu - xl)/xl) > tol )
            d = R*(xu - xl);
            x1 = xl + d;
            x2 = xu - d;
            if f(x1) < f(x2)
                xl = x2;
            else
                xu = x1;
            end
%             plot(xu,f(xu),'ro','MarkerSize',5,'LineWidth',5); 
        end
    end
    xopt = xu;
    yopt = f(xopt);
%     hold off
end
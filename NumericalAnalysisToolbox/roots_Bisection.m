function [answerRoots] = roots_Bisection(f,startPt,endPt,epsilon)
%% ***********************************************************************
% FUNCTION ROOTS_BISECTIONS
% Purpose: Calculates the roots of a given function in between two points,
% as determined via the Bisection method.
%
% Function call: [answerRoots] = roots_Bisection(f,startPt,endPt,epsilon)
%
% Input: f = polynomial function
% startPt = starting point of the search
% endPt = Ending point of the search
% epsilon = Stopping criterion
%
% Outputs: answerRoots = array of roots for the given function.
%
% Adam Hollock
% 15 January 2012
%% ***********************************************************************

diff = 100000000;                  %Sets up a large difference so the loop will run through at least once.
xl = startPt;                    %Initializes xl and xu as the starting and ending points.
xu = endPt;
xr = (xl + xu)/2;
counter = 0;

while diff > epsilon && f(xl)*f(xu)<0
    if f(xl)*f(xr) > 0           %This will move either the lower or hte higher end point to the mid,
        xl = xr;                  %Dependent on the logic
    elseif f(xu)*f(xr) > 0
        xu = xr;
    end
    
    xrnew = (xl + xu)/2;         %Finds the middle point.
    diff = abs((abs(xr)-abs(xrnew))/abs(xr))*100;    %Updates the difference for the next loop.
    xr = xrnew;                  %Updates the x value
    counter = counter + 1;
    if counter >= 50              %This will catch the program if a convergence takes too long.
        error('I think there might be a problem capn.');
    end
    
end
IternationNumBisection = counter
answerRoots = xr;
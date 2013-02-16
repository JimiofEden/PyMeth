function [answerRoots] = roots_FalsePosition(f,startPt,endPt,epsilon)
%% ***********************************************************************
% FUNCTION ROOTS_FALSEPOSITION
% Purpose: Calculates the roots of a given function in between two points,
% as determined via the False Position method.
%
% Function call: [answerRoots] = roots_FalsePosition(f,startPt,endPt,epsilon)
%
% Input: f = polynomial function
% startPt = The starting point for the function bracket
% endPt = The ending point for the function bracket
% epsilon = Stopping criterion
%
% Outputs: answerRoots = array of roots for the given function.
%
% Adam Hollock
% 15 January 2012
%% ***********************************************************************

diff = 100000000;                 %Sets up a large difference so the loop will run through at least once.
xl = startPt;
xu = endPt;
xr = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));
counter = 0;

while diff > epsilon
    if f(xl)*f(xr) > 0           %This will move either the lower or hte higher end point to the mid,
        xl = xr;                 %Dependent on the logic
    elseif f(xu)*f(xr) > 0
        xu = xr;
    end
    
    xrnew = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));
    diff = abs((abs(xr)-abs(xrnew))/abs(xr))*100;    %Updates the difference for the next loop.
    xr = xrnew;                  %Updates the x value
    counter = counter + 1;
    if counter >= 200             %This will catch the program if a convergence takes too long.
        error('I think there might be a problem capn.');
    end
    
end
IternationNumFalsePosition = counter
answerRoots = xr;
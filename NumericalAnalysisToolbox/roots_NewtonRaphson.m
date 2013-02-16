function [answerRoots] = roots_NewtonRaphson(f,df,guess,epsilon)
%% ***********************************************************************
% FUNCTION ROOTS_FALSEPOSITION
% Purpose: Calculates the roots of a given function in between two points,
% as determined via the NewtonRaphson method.
%
% Function call: [answerRoots] = roots_NewtonRaphson(f,df,guess,epsilon)
%
% Input: f = polynomial function
% df = The derivative of f
% endPt = The ending point for the function bracket
% epsilon = Stopping criterion
%
% Outputs: answerRoots = array of roots for the given function.
%
% Adam Hollock
% 15 January 2012
%% ***********************************************************************

diff = 100000000;                 %Sets up a large difference so the loop will run through at least once.
counter = 0;
x = guess;

while diff > epsilon

    
    xnew = x - f(x)/df(x);      %Newton Raphson Equation
    diff = abs((abs(x)-abs(xnew))/abs(x))*100;    %Updates the difference for the next loop.
    x = xnew;                  %Updates the x value
    counter = counter + 1;
    if counter >= 50             %This will catch the program if a convergence takes too long.
        error('I think there might be a problem capn.');
    end
    
end
IternationNumNewtonRaphson = counter
answerRoots = x;
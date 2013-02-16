function [answerRoots] = roots_FixedPoint(f,g,guess,epsilon)
%% ***********************************************************************
% FUNCTION ROOTS_FIXEDPOINT
% Purpose: Calculates the roots of a given function in between two points,
% as determined via the Fixed-Point method.
%
% Function call: [answerRoots] = roots_FixedPoint(f,g,guess,epsilon)
%
% Input: f = polynomial function
% g = f with x on the other side of the equation
% guess = Initial guess of root.
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
    xnew = g(x);
    diff = abs((abs(x)-abs(xnew))/abs(x))*100;    %Updates the difference for the next loop.
    x = xnew;                   %Updates the x value
    counter = counter + 1;
    if counter >= 50              %This will catch the program if a convergence takes too long.
        error('I think there might be a problem capn.');
    end
    
end
IternationNumFixedPoint = counter
answerRoots = x;
function [answerRoots] = roots_ModifiedSecant(f,guess,delta,epsilon)
%% ***********************************************************************
% FUNCTION ROOTS_MODIFIEDSECANT
% Purpose: Calculates the roots of a given function in between two points,
% as determined via the Incremental Search method
%
% Function call: [answerRoots] = roots_ModifiedSecant(f,guess,delta,epsilon)
%
% Input: f = polynomial function
% guess = Initial guess of the method
% delta = Differential size
% epsilon = Stopping criterion
%
% Outputs: answerRoots = array of roots for the given function.
%
% Adam Hollock
% 15 January 2012
%% ***********************************************************************

diff = 1000000;                  %Sets up a large difference so the loop will run through at least once.
x = guess;
counter = 0;
xnew = 0;

while diff > epsilon
    xnew = x - delta*x*f(x)/(f(x+delta*x)-f(x)); %Modified secant equation
    diff = abs(f(x)-f(xnew));          %Updates the difference for the next loop.
    x = xnew;                   %Updates the x value
    counter = counter + 1;
    if counter > 50             %This will catch the program if a convergence takes too long.
        error('I think there might be a problem capn.');
    end
end
IternationNumModifiedSecant = counter
answerRoots = x;
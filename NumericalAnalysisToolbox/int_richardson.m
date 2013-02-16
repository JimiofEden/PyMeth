function [integral] = int_richardson(f, a, b, error, maxIt)
%% ***********************************************************************
% FUNCTION int_richardson
% Purpose: Calculates the integral using aan iterative Richardson metdho,
% where the iterations stop after meeting a designated relative error
% criterion or maximum iterations
%
% Function call: [integral] = int_richardson(f, a, b, samples, maxIt)
%
% Input: f = input function
% a = starting point of the integral
% b = ending point of the integral
% stamples = Number of data points to take in between a and b.
% error = error tolerance criterion
% maxIt = Maximum number of iterations to use
%
% Outputs: integral = Sum of the area under the curve calculated by this
% method.
%
% Adam Hollock
% 4 March 2012
%% ***********************************************************************

% Will give default values if the error tolerance and maximum number of
% iterations are not set.
if nargin < 4
    error = 1e-6;
    if nargin < 5
        maxIt = 300;
    end
end

%initalizes samples to two segments (3 data points) and one segment (two data points)
h1 = 3;
h2 = 2;
%initailizes counter and error such that the loop is entered
counter = 1;
errorChange = 10000000;

while (errorChange >= error) && (counter < maxIt)
    %calculates new values using richardson equation
    int1 = int_trap(f,a,b,h2) + (1/((h1/h2)^2-1))*(int_trap(f,a,b,h2) - int_trap(f,a,b,h1));
    h1 = h1*2-1;
    h2 = (h1+1)/2;
    int2 = int_trap(f,a,b,h2) + (1/((h1/h2)^2-1))*(int_trap(f,a,b,h2) - int_trap(f,a,b,h1));
    
    newIntegral = ((4^counter)*int2 - int1)/((4^counter)-1);
    %Avoids using oldIntegral if first iteration
    if counter ~= 1
        errorChange = ((abs(oldIntegral - newIntegral))/abs(oldIntegral))*100;
    end
    
    %sets old value
    oldIntegral = newIntegral;
    counter = counter + 1;
end
integral = newIntegral;
function [integral] = int_simp(f, a, b, samples)
%% ***********************************************************************
% FUNCTION int_simp
% Purpose: Calculates the integral via Simpson's rule. Adjust the
% calculation of the integral based on whether the number of segments is
% odd or even.
%
% Function call: [integral] = int_simp(f, a, b, samples)
%
% Input: f = input function
% a = starting point of the integral
% b = ending point of the integral
% stamples = Number of data points to take in between a and b.
%
% Outputs: integral = Sum of the area under the curve calculated by this
% method.
%
% Adam Hollock
% 27 February 2012
%% ***********************************************************************
functionIndices = linspace(a,b,samples);
h = (b-a)/(samples-1);
%This is the case where there are an odd amount of segments (3/8 rule)
if mod(samples+1,2) == 0
    intsum = (1/3)*h*(f(a) + 4*f(functionIndices(2)) + f(functionIndices(3)));
    intsum = intsum + h*(3/8)*(f(b) + f(functionIndices(3)) +  3*sum(f(functionIndices(4:2:samples-1))) + 3*sum(f(functionIndices(5:2:samples-2))));    
%This is the case where there are an even amount of segments (1/3 rule)
else
    intsum = (1/3)*h*(f(a) + f(b) + 4*sum(f(functionIndices(2:2:samples-1))) + 2*sum(f(functionIndices(2:2:samples-2))));
end
%This is the formula for the Simpson's rule
integral = intsum;
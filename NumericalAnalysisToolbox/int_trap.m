function [integral] = int_trap(f, a, b, samples)
%% ***********************************************************************
% FUNCTION int_trap
% Purpose: Calculates the integral via the composite trapezoid rule
%
% Function call: [integral] = int_newton(f, a, b, samples)
%
% Input: f = input function
% a = starting point of the integral
% b = ending point of the integral
% stamples = Number of samples to take in between a and b.
%
% Outputs: integral = Sum of the area under the curve calculated by this
% method.
%
% Adam Hollock
% 27 February 2012
%% ***********************************************************************

%This is the formula for the composite trapezoid rule.
functionValues = f(linspace(a,b,samples));
integral = (b-a)*(sum(functionValues) + sum(functionValues(2:end-1)))/(2*(samples-1));
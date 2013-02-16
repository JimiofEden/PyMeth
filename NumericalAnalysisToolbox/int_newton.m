function [integral] = int_newton(f, a, b)
%% ***********************************************************************
% FUNCTION int_newton
% Purpose: Calculates the integral via the Newton-Cotes method.
%
% Function call: [integral] = int_newton(f, b, a)
%
% Input: f = input function
% b = ending point of the integral
% a = starting point of the integral
%
% Outputs: integral = Sum of the area under the curve calculated by this
% method.
%
% Adam Hollock
% 27 February 2012
%% ***********************************************************************

%This is the simple formula for the Newton-Cotes trapezoid rule.
integral = (b-a)*((f(a)+f(b))/2);
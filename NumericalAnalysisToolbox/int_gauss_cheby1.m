function [integral] = int_gauss_laguerre(f, a, b, order)
%% ***********************************************************************
% FUNCTION int_laguerre
% Purpose: Calculates the integral using Gauss-laguerre integration
%
% Function call: [integral] = int_gauss_laguerre(f, a, b, order)
%
% Input: f = input function
% a = starting point of the integral
% b = ending point of the integral
% order = degree of Legendre polynomial to use.
%
% Outputs: integral = Sum of the area under the curve calculated by this
% method.
%
% Adam Hollock
% 4 March 2012
%% ***********************************************************************

%Creates the location vector
rootsP = ((cos(2*(1:order)-1)*pi)./(2*order))'*ones(1,3);

%initializes the solution vector
W = (pi/order)*ones(order,1);

%Finds the new values of x to evaluate between a and b
K = (b-a)/2;
xnew = ((b+a)/2) + ((b-a)/2)*rootsP(2,:);

%Calculates the integral using the weights
integral = K*(sum(W'.*f([xnew'])));

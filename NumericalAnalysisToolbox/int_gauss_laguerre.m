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

%Initializes the sum
sumL = [0];
%This will properly initialize the size of the vector to the degree of hte
%polynomial
for i = 1:order
    sumL = [0 sumL];
end

%This will compute the coefficients of the laguerre polynomial
for i = 0:order
    sumL(i+1) = sumL(i+1) + (((-1)^i)/factorial(i))*(factorial(order)/(factorial(order-i)*factorial(i)));
end
%Flips the laguerre polynomial for use with matlab
sumL = fliplr(sumL);

%initializes the root vector (with a row of 1s)
rootsP = (1:order)./(1:order);
%initializes the solution vector
B = [1];
%This will find order rows of roots for the laguerre polynomial, as well as
%the solution vector
for i = 2:order
    rootsP = [rootsP;roots(sumL)'.^(i-1)];
    if i == 2
        B = [B;0];
    else
        B = [B;(i-1)*B(i-1)];
    end
end

W = rootsP\B;
%Finds the new values of x to evaluate between a and b
K = (b-a)/2;
xnew = ((b+a)/2) + ((b-a)/2)*rootsP(2,:);

%Calculates the integral using the weights
integral = K*(sum(W.*f([xnew'])));

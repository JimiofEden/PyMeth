function [integral] = int_gauss_legendre(f, a, b, order)
%% ***********************************************************************
% FUNCTION int_legendre
% Purpose: Calculates the integral using Gauss-Legendre integration
%
% Function call: [integral] = int_gauss_legendre(f, a, b, samples)
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

%This will compute the coefficients of the legendre polynomial
for i = 0:1:order/2
    sumL((order-(i*2))+1) = sumL((order-(i*2))+1) + (-1)^i*(factorial(2*order-2*i))/((2^order)*factorial(i)*factorial(order-i)*factorial(order-2*i));
end
%Flips the legendre polynomial for use with matlab
sumL = fliplr(sumL);

%initializes the root vector (with a row of 1s)
rootsP = (1:order)./(1:order);
%initializes the solution vector
B = [2];
%This will find order rows of roots for the legendre polynomial, as well as
%the solution vector
for i = 2:order
    rootsP = [rootsP;roots(sumL)'.^(i-1)];
    B = [B;((1-(-1)^i)/i)];
end

W = rootsP\B;
%Finds the new values of x to evaluate between a and b
K = (b-a)/2;
xnew = ((b+a)/2) + ((b-a)/2)*rootsP(2,:);

%Calculates the integral using the weights
integral = K*(sum(W.*f([xnew'])));

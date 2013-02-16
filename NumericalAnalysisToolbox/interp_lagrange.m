function [coeff, inter] = interp_lagrange(x, y)
%% ***********************************************************************
% FUNCTION interp_lagrange
% Purpose: produces the polynomial (and the interpolated data) that fits an
% x,y data set in which the polynomial passes exactly through the data
% points.
%
% Function call: [coeff, inter] = interp_lagrange(x, y)
%
% Input: x = 1xN Input vector of indices
% y = 1xN Input vector of values
%
% Outputs: coeff - Coefficients of the polynomial
% inter - interpolated data 
%
% Adam Hollock
% 20 February 2012
%% ***********************************************************************

%Ensures that the data and index vector are the same lengths
if size(x,2) ~= size(y,2)
    error('I''m not even supposed to be here today!')
end

%Initializing numerators and denominators
num = ones(size(x,2),size(x,2));
den = ones(size(x,2),1);

%Initializes the lagrangian vector
L = ones(size(x,2),size(x,2));

%Initializes a time vector
tt = min(x):0.01:max(x);

%This will build the langrangian functions
for i = 1:size(x,2);
    numConv = 1;
    for k = 1:i-1
        numConv = conv(numConv,[1 -x(k)]);
        den(i) = den(i)*(x(i) - x(k));
    end
    for k = i+1:size(x,2)
        numConv = conv(numConv,[1 -x(k)]);
        den(i) = den(i)*(x(i) - x(k));
    end
    num(i,:) = numConv;
    L(i,:) = num(i,:)./den(i);
end

%Adds like terms in the lagrangian vector & multiplies by y coefficients
coeff = sum(y*L,1);

%plots the data
inter = polyval(coeff,tt);

scatter(x,y,'b');
hold on
plot(tt,inter, 'black');
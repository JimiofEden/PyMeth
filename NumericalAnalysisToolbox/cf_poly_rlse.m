function [coeff, r_2] = cf_poly_rlse(x, y, xnew, ynew, order)
%% ***********************************************************************
% FUNCTION cf_poly_rlse
% Purpose: recursive polynom
%
% Function call: [coeff, r_2] = cf_poly_rlse(x, y, order)
%
% Input: x = 1xN Input vector of data
% y = 1xN Input vector of indices 
% order = an optional input: set of standard deviations for the weighted
% least squares method
%
% Outputs: coeff - Coefficients of the data
% r_2 - coefficient of determination
%
% Adam Hollock
% 12 February 2012
%% ***********************************************************************

%Ensures that the data and index vector are the same lengths
if size(x,1) ~= size(y,1)
    error('It''s a trap!')
end

%length of the input data
n = size(x,1);

%Sets up a dummy variable for coefficients
A = ones(size(x,1),order+1);

%This sets up the multiplication matrix with the different exponents
for i = 0:order
    A(:,i+1) = (x.^(order-i));
end

B = y;


for i = 1:length(xnew)
    %sets up a blank matrix for adding orders
    a = zeros(1,order+1);
    for k = 0:order
        a(:,k+1) = xnew(i).^(order-k)';
    end
    a = a';
    b = ynew(i);
    B = [B;b'];
    A = [A;a'];
    P = inv([A'*A]);
    K = P*a/(a'*P*a+1);
    P = P-K*a'*P;
end


X = (A'*A)\(A'*B);


tt = min(x):0.01:max(x);

%This will plot the polynomial
y_use = polyval(X',tt);
figure(3)
plot(tt,y_use)
hold on
plot(x,y,'g')

r_2 = 2;
coeff = X';
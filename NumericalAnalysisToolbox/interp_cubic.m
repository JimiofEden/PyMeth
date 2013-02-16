function [inter] = interp_pade(x, y, method, deriv)
%% ***********************************************************************
% FUNCTION interp_lagrange
% Purpose: produces the interpolated data for an x,y data set using the
% cubic spline technique
%
% Function call: [coeff, inter] = interp_pade(x, y, method, Derivative)
%
% Input: x = input indices
% y = input values
% method = Method to use. Either 'first', 'second', or 'extrap'
% deriv = Optional input 1x2 array with 1st or 2nd derivative values
%
% Outputs: inter - interpolated data 
%
% Adam Hollock
% 20 February 2012
%% ***********************************************************************

%Ensures that the data and index vector are the same lengths
if size(x,2) ~= size(y,2)
    error('I''m not even supposed to be here today!')
end

%Calculates the width between data points
h = zeros(length(x)-1,1);
for i = 2:length(x)
    h(i-1) = x(i) - x(i-1);
end

%calculates dy
dy = zeros(length(y)-1,1);
for i = 2:length(y)
    dy(i-1) = (y(i) - y(i-1))/h(i-1);
end

        
switch(method)
    case{'first'}
        s0 = deriv(1);
        sN = deriv(2);
        
        %Builds the A matrix
        A = zeros(length(x));
        A = A + diag(h,1) + diag(h,-1);
        A(1,1) = 2*h(1);
        A(length(x),length(x)) = 2*h(length(x)-1);
        for i = 2:length(A)-1
            A(i,i) = 2*(h(i-1) + h(i));
        end
        
        %Builds the B matrix
        B = zeros(length(x),1);
        B(1) = 3*(dy(1) - s0);
        B(length(x)) = 3*(sN - dy(size(dy,1)));
        for i = 2:size(B,1)-1
            B(i) = 3*(dy(i) - dy(i-1));
        end
        
    case{'second'}
        s0 = deriv(1)/2;
        sN = deriv(2)/2;        
        
        %Builds the A matrix
        A = zeros(length(x));
        A = A + (diag([0;h(2:end)],1) + diag([h(1:end-1);0],-1));
        A(1,1) = 2;
        A(length(x),length(x)) = 2;
        for i = 2:length(A)-1
            A(i,i) = 2*(h(i-1) + h(i));
        end
        
        %Builds the B matrix
        B = zeros(length(x),1);
        B(1) = s0;
        B(length(x)) = sN;
        for i = 2:size(B,1)-1
            B(i) = 3*(dy(i) - dy(i-1));
        end
    case{'extrap'}
        s0 = deriv(1)/2;
        sN = deriv(2)/2;        
        
        %Builds the A matrix
        A = zeros(length(x));
        A = A + diag([0;h(2:end)],1) + diag([h(1:end-1);0],-1);
        A(1,1) = h(2);
        A(2,1) = h(1);
        A(1,2) = -(h(1) + h(2));
        A(length(x),length(x)-2);
        A(length(x),length(x)-1) = -(h(length(x)-1) + h(length(x)-2));
        A(length(x),length(x)) = h(length(x)-2);
        for i = 2:length(A)-1
            A(i,i) = 2*(h(i-1) + h(i));
        end
        
        %Builds the B matrix
        B = zeros(length(x),1);
        for i = 2:size(B,1)-1
            B(i) = 3*(dy(i) - dy(i-1));
        end
end

%initializes and populates the S matrix
S = zeros(length(x),length(x));
S(:,3) = (A\B)';
S(:,1) = y';
S(:,2) = [dy - (h/3).*(S(2:end,3) + 2*S(1:end-1,3));0];
S(:,4) = [(S(2:end,3)-S(1:end-1,3))./(3*h);0];

%Initializes the spline vector
spline = zeros(length(x)-1,4);
%Writes the spline equations
for i = 1:length(x)-1
    xcube = conv([1 -x(i)],conv([1 -x(i)],[1 -x(i)]));
    xsquare = conv([1 -x(i)], [1 -x(i)]);
    spline(i,:) = S(i,4)*xcube + S(i,3)*[0 xsquare] + S(i,2)*[0 0 1 -x(i)] + [0 0 0 S(i,1)];
end

%plots the data points obtained
scatter(x,y,'r');
%This will plot all of the interpolated data
inter = zeros(length(x), 1001);
for i = 1:length(x)-1
    tt = x(i):(x(i+1)-x(i))/1000:x(i+1);
    inter(i,:) = polyval(spline(i,:),tt);
    hold on
    plot(tt,inter(i,:));
end
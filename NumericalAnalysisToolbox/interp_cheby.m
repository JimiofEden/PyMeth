function [coeff, inter] = interp_cheby(f, startpt, endpt, N)
%% ***********************************************************************
% FUNCTION interp_cheby
% Purpose: produces the polynomial (and the interpolated data) that fits an
% x,y data set in which the polynomial passes exactly through the data
% points.
%
% Function call: [coeff, inter] = interp_cheby(x, y)
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

%Sets a time scale with 1000 points inbetween the starting and ending
%points.
tt = startpt:(1/1000):endpt;

%Finds the Chebyshev polynomials of the order of the system
Trange = zeros(N+1);
for w = 1:N+1
    t0 = 1;
    t1 = [1 0];
    if w == 1
        T = t0;
    elseif w == 2;
        T = t1;
    else
        for k=3:w
            T = [2*t1 0] - [0 0 t0];
            t0 = t1;
            t1 = T;
        end
    end
    Trange(w,(length(Trange)-length(T)+1):length(Trange)) = T;
end

%Initializes the xkprime vector
xkpri = zeros(1,N+1);

%Finds the values of xkprime
for k = 1:N+1
    xkpri(k) = cos(pi*(2*N+1-2*(k-1))/(2*(N+1)));
end

%Initializes the xk vector
xk = zeros(1,N+1);

%Calculates xk
for k = 1:N+1
    xk(k) = ((endpt-startpt)/2)*xkpri(k) + (startpt+endpt)/2;
end

%Calculates the weights
D = zeros(N+1,1);

%initializes sums
xksum = 0;

%sums fk(xk)
for i = 1:N+1
    xksum = xksum + f(xk(i));
end
    
%Finds the first weight d0
D(1) = (1/(N+1))*xksum;

%This will find weights 1 to the order
for i = 2:N+1
    weightsum = 0;
    for w = 1:N+1
        weightsum = weightsum + f(xk(w)).*polyval(Trange(i,:),xkpri(w));
    end
    D(i) = weightsum*(2/(N+1));
end

%Reconstructs function using approximation
Csum = 0;
for i = 1:N+1
    Csum = Csum + D(i)*Trange(i,:);
end
coeff = Csum;

factor = conv((2/(endpt-startpt)),[1 -(startpt+endpt)/2]);

for i = length(coeff):-1:1
    coeff(i) = coeff(i)*factor(1)^(length(coeff)-i);
end

inter = polyval(coeff,tt);

xdot = startpt:endpt;
ydot = [];
for i = 1:length(xdot)
    ydot = [ydot f(xdot(i))];
end

scatter(xdot,ydot)
hold on
plot(tt,inter, 'bla');
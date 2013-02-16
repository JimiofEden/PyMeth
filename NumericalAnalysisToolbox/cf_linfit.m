function [coeff, r_2] = cf_linfit(x, y,  model)
%% ***********************************************************************
% FUNCTION cf_linfit
% Purpose: a linear fitting function that will, given a set of data,
% provide the coefficients, for linear, exponential, power, and
% saturation growth rate models, as well as the coefficient of
% determination and plots the data.
%
% Function call: [coeff, coeff_det ] = cf_linfit(x, y)
%
% Input: x = 1xN Input vector of data
% y = 1xN Input vector of indices 
% model = 'linear', 'exponential', 'power', or 'saturation'. This will
% definte the specific type of the model.
%
% Outputs: coeff - Coefficients of the data
% r_2 - coefficient of determination
%
% Adam Hollock
% 9 February 2012
%% ***********************************************************************

%Ensures that the data and index vector are the same lengths
if size(x,1) ~= size(y,1)
    error('It''s a trap!')
end

%This will eliminate error for higher methods methods
if find(x==0)
    x = x+1;
end

%sets up number of points of data
n = size(x,1);

%sets up a time span
tt = [min(x):0.1:max(x)];

switch lower(model)
    case{'linear'}
        y_use = y;
        x_use = x;
    case{'exponential'}
        y_use = log(y);
        x_use = x;
    case{'power'}
        y_use = log10(y);
        x_use = log10(x);
    case{'saturation'}
        y_use = 1./y;
        x_use = 1./x;
end

%sets up the average of data and indices
y_mean = sum(y_use)/n;
x_mean = sum(x_use)/n;

%Sets up the sum of the squares
St = sum((y_use-y_mean).^2);

%Standard deviation
sy = sqrt(St/(n-1));

%Variance and coefficient of variation
sy_2 = sqrt((sum(y_use.^2) - (sum(y_use)^2)/n)/n-1);
cv = (sy/y_mean)*100;

%Sets up the slope and intercept
a1 = (n*sum(x_use.*y_use) - sum(x_use)*sum(y_use))/(n*sum(x_use.^2) - sum(x_use)^2);
a0 = y_mean - a1*x_mean;

%Sum of the squares of the stimate residuals
Sr = sum((y-a0-a1.*x).^2);

%Find the coefficient of determination
r_2 = (St-Sr)/St;

switch lower(model)
    case{'linear'}
        %This will plot the linear function
        f = a0 + a1*tt;
        figure(1)
        plot(tt,f)
        hold on
        plot(x,y,'g');
        xlabel('x');
        ylabel('y');
        hold off
        
    case{'exponential'}
        %This will plot the linear function
        f = a0 + a1*tt;
        figure(1)
        plot(tt,f)
        hold on
        plot(x,y_use,'g');
        xlabel('x');
        ylabel('log(y)');
        hold off
        
        %This will plot the nonlinear function
        A = exp(a0);
        lam = a1;
        F = A*exp(lam*tt);
        figure(2)
        plot(tt,F)
        hold on
        plot(x,y,'g');
        xlabel('x');
        ylabel('y');
        hold off
        
    case{'power'}
        %This will plot the linear function
        f = a0 + a1*log10(tt);
        figure(1)
        plot(log10(tt),f)
        hold on
        plot(x_use,y_use,'g');
        xlabel('log(x)');
        ylabel('log(y)');
        hold off
        
        %This will plot the nonlinear function
        A = 10^a0;
        B = a1;
        F = A*tt.^B;
        figure(2)
        plot(tt,F)
        hold on
        plot(x,y,'g');
        xlabel('x');
        ylabel('y');
        hold off
        
    case{'saturation'}
        %This will plot the linear function
        f = a0 + a1./(tt);
        figure(1)
        plot(1./(tt),f)
        hold on
        plot(x_use,y_use,'g');
        xlabel('1/(x)');
        ylabel('1/(y)');
        hold off
        
        %This will plot the nonlinear function
        A = 1/a0;
        B = a1/a0;
        F = A*(tt./(B+tt));
        figure(2)
        plot(tt,F)
        hold on
        plot(x,y,'g');
        xlabel('x');
        ylabel('y');
        hold off
end

coeff = [a0, a1];
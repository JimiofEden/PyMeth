#Requires numpy and matlibplot
import string
import math

from numpy import *
from pylab import *


def linfit(x, y,  model):
    '''
    %% ***********************************************************************
    % THIS IS THE ORIGINAL MATLAB COMMENT FILE
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
    '''  
    #Ensures that the data and index vector are the same lengths
    #P: Shape is the size function. 0 for col, 1 for row
    #if x.shape[0] != y.shape[0]:
    #    error('It''s a trap!')

    #This will eliminate error for higher methods methods
    #P: Nonzero replaces find, the 3rd element returned is what we want.
    if shape(nonzero(x==0))[1]:
        x = x+1

    #sets up number of points of data
    n = x.shape[0]

    #sets up a time span
    #P: arange creates an array
    tt = arange(min(x),max(x),0.1, dtype=float)

    #P:.lower() puts all letters to lowercase
    #Requires String module
    if (model.lower() == 'linear'):
        y_use = y
        x_use = x
    elif (model.lower() == 'exponential'):
        y_use = log(y)
        x_use = x
    elif(model.lower() == 'power'):
        y_use = log10(y)
        x_use = log10(x)
    elif(model.lower() == 'saturation'):
        y_use = 1/y
        x_use = 1/x

    #sets up the average of data and indices
    y_mean = sum(y_use)/n
    x_mean = sum(x_use)/n

    #Sets up the sum of the squares
    St = sum((y_use-y_mean)**2)

    #Standard deviation
    #P: sqrt requires math module
    sy = math.sqrt(St/(n-1))

    #Variance and coefficient of variation
    sy_2 = sqrt(sum(y_use**2) - (sum(y_use**2)/n)/n-1)
    cv = (sy/y_mean)*100

    #Sets up the slope and intercept
    a1 = (n*sum(multiply(x_use,y_use)) - sum(x_use)*sum(y_use))/(n*sum(x_use**2) - sum(x_use)**2)
    a0 = y_mean - a1*x_mean

    #Sum of the squares of the stimate residuals
    Sr = sum((y-a0-multiply(a1,x))**2)

    #Find the coefficient of determination
    r_2 = (St-Sr)/St

    if (model.lower() == 'linear'):
        #This will plot the linear function
        f = a0 + multiply(a1,tt)

        plot(tt,f, linewidth=1.0)
        grid(True)
        hold(True)
        plot(x,y, color='g');
        xlabel('x');
        ylabel('y');
        show()

    elif (model.lower() == 'exponential'):
        #this will plot the linear function
        f = a0 + multiply(a1,tt)
        figure(1)
        plot(tt,f)
        hold(True)
        plot(x,y_use,color='g')
        xlabel('x')
        ylabel('log(y)')

        #This will plot the nonlinear function
        A = exp(a0);
        lam = a1;
        F = A*exp(lam*tt);
        figure(2)
        plot(tt,F)
        hold(True)
        plot(x,y,color='g')
        xlabel('x')
        ylabel('y')
        show()

    elif(model.lower() == 'power'):
        #This will plot the linear function
        f = a0 + a1*log10(tt);
        figure(1)
        plot(log10(tt),f)
        hold(True)
        plot(x_use,y_use,color='g')
        xlabel('log(x)')
        ylabel('log(y)')

        #This will plot the nonlinear function
        A = 10**a0;
        B = a1;
        F = A*tt**B;
        figure(2)
        plot(tt,F)
        hold(True)
        plot(x,y,color='g')
        xlabel('x')
        ylabel('y')
        show()

    elif(model.lower() == 'saturation'):
        #This will plot the linear function
        f = a0 + a1/(tt);
        figure(1)
        plot(tt**-1,f)
        hold(True)
        plot(x_use,y_use,color='g')
        xlabel('1/(x)')
        ylabel('1/(y)')

        #This will plot the nonlinear function
        A = 1*a0**-1;
        B = a1*a0**-1;
        F = A*(tt/(B+tt));
        figure(2)
        plot(tt,F)
        hold(True)
        plot(x,y,'g')
        xlabel('x')
        ylabel('y')
        show()

    coeff = [a0, a1];
    print coeff
    print r_2
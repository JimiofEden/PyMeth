#Requires numpy and matlibplot
import string
import math

from numpy import *
from pylab import *

def poly_rlse(x, y, xnew, ynew, order):
    '''
    ORIGINAL MATLAB COMMENTS
    %% ***********************************************************************
    % FUNCTION cf_poly_rlse
    % Purpose: a recursive polynomial least square fit. 
    %
    % Function call: [coeff, r_2] = cf_poly_rlse(x, y, xnew, ynew order)
    %
    % Input: x = 1xN Input vector of data
    % y = 1xN Input vector of indices 
    % order = set of standard deviations for the weighted
    % least squares method
    % xnew = 100 points inbetween x
    % ynew = 100 points inbewteen y
    % Outputs: coeff - Coefficients of the data
    % r_2 - coefficient of determination
    %
    % Adam Hollock
    % 12 February 2012
    %% ***********************************************************************
    '''
    #Ensures that the data and index vector are the same lengths
    #P: Shape is the size function. 0 for col, 1 for row
    #if x.shape[0] != y.shape[0]:
    #    error('It''s a trap!')

    #length of the input data
    n = x.shape[0]

    #Sets up a dummy variable for coefficients
    A = ones((x.shape[0],order+1))

    #This sets up the multiplication matrix with the different exponents
    #May be faulty
    for i in range(0,order+1):
        A[:,i] = x**(order-i)

    B = mat([y])
    B = B.conj().transpose()


    for i in range(0,xnew.shape[0]):
        #sets up a blank matrix for adding orders
        a = zeros((1,order+1))
        for k in range(order+1):
            #.conj().transpose() essentially acts as the ' operator
            a[:,k] = (xnew[i-1]**(order-k)).conj().transpose()
        a = a.reshape(-1,1)
        b = mat([ynew[0,i]])
        #concatenate instead of [B;b]
        B = concatenate((B,b.conj().transpose()))
        A = concatenate((A,a.conj().transpose()))
        P = linalg.inv(dot((A.conj().transpose()),A))
        K = P*a/((a.conj().transpose())*P*a+1)
        P = P-K*(a.conj().transpose())*P

    X = linalg.solve(dot((A.conj().transpose()),A),dot((A.conj().transpose()),B))


    tt = arange(min(x),max(x),0.001, dtype=float)

    #This will plot the polynomial
    print X
    print tt.shape
    y_use = polyval(X,tt);
    figure(1)
    plot(tt, y_use, 'b')
    hold(True)
    plot(x,y,'g')
    show()

    r_2 = 2
    coeff = X.conj().transpose()

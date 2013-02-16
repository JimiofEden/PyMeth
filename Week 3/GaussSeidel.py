from numpy import *

#function [x, count] =
def gs(A,b,guess = None,eps = None,lam = None,maxit = None):
    '''
    %% ***********************************************************************
    % FUNCTION GaussSeidel
    % Purpose: Performs the gauss seidel iterative method of solution
    %
    % Function call: [x] = GaussSeidel(A,b,guess,eps,lam)
    %
    % Input: A = Input system of equations AX = B
    % b = solution of system of equations AX = B
    % guess = Initial guess. Will be set to all 0s if nothing is entered.
    % eps = tolerance of difference between. Will be set to 1e-6 if nothing is
    % entered
    % lam = relaxation constant. Will be set to 1 if nothing is entered.
    % maxit = maximum number of iterations allowed. Will be set to 10000 if
    % nothing is entered
    %
    % Outputs: x = solution of x's in the system of equations AX = B
    %
    % Adam Hollock
    % 26 January 2012
    %% ***********************************************************************
    '''
    if guess == None:
        guess = zeros(A.shape[0],1)
    if eps == None:
        eps = 1e-2
    if lam == None:
        lam = 1
    if maxit == None:
        maxit = 10000

    #Will catch the matrix if the number of variables don't match the number of
    #solutions or the size of the system in general
    if A.shape[1] != b.shape[0] or A.shape[0] != guess.shape[0]:
        error('Great Scott!!!')

    #initializes an error matrix, an x matrix, and a counter.
    errorValues = ones(guess.shape[0]).reshape(guess.shape[0],1)
    x = guess
    count = 0

    #Begins the gauss seidel solver algorithm
    while ((max(errorValues) > eps) and (maxit > count)):
        #initializes a solution matrix.
        xnew = x
        for i in arange(0,guess.shape[0]):
            #Performs the main mathematical work of the gauss-seidel function.
            Ause = concatenate((A[i,:i-1],A[i,i+1:]),1)
            xuse = concatenate((xnew[:i-1],xnew[i+1:]))
            xnew[i] = (b[i]-Ause*xuse)/(A[i,i])
            #Applies the relaxation constant
            xnew[i] = lam*xnew[i] + (1-lam)*x[i]
            errorValues[i] = abs((xnew[i]-x[i])/xnew[i])*100

        x = xnew
        count = count + 1
    return x
from numpy import *

def epower(A, guess = None, eps = None):
    '''
    %% ***********************************************************************
    % FUNCTION eig_power
    % Purpose: Finds the eigenvalues and eigenvectors of a given matrix using
    % the power method
    %
    % Function call: [eigVal, eigVect] = eig_power(A)
    %
    % Input: A = Input matrix
    %
    % Outputs: eigVal - Output array of eigenvalues
    % eigVect - Output array of eigenvectors
    % counter - Number of iterations it took to solve for the eigenvalues
    %
    % Adam Hollock
    % 5 February 2012
    %% ***********************************************************************
    '''
    #sets up a large error for initialization & initializes counter
    error = 10000*ones((A.shape[0],1))
    counter = 0

    if guess == None:
        #If no guess is entered, an array of ones will be used
        guess = ones((A.shape[0],1))
    if eps == None:
        #If no tolerance is input, 1e-6 will be used
        eps = 1e-6

    while error.max() > eps:
        eigVal = guess.max()
        newGuess = ((A*guess)/eigVal)
        for i in arange(1,guess.shape[0]):
            error = linalg.norm(newGuess[i] - guess[i],Inf)
        guess = newGuess
        counter = counter + 1

    eigVal = guess.max()
    eigVect = guess/eigVal
    return eigVal, eigVect
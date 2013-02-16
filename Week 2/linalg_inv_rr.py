from numpy import *
import linalg_inv_rr

def rr(P):

    '''
    %% ***********************************************************************
    % FUNCTION linalg_inv_rr
    % Purpose: Calculates the inverse of a matrix using row reducing methods.
    % Additionally will check if the matrix is square, and will return the
    % pseudoinverse, if not.
    %
    % Function call: [Ainv] = linalg_inv_rr(A)
    %
    % Input: A = Input matrix to be inverted
    %
    % Outputs: Ainv = the inverted matrix
    %
    % Adam Hollock
    % 19 January 2012
    %% ***********************************************************************
    '''
    #This will take the pseudoinverse in case the matrix in question is not
    #square.
    #Underdetermined case
    if P.shape[0] < P.shape[1]:
        Ainv = P.T*linalg_inv_rr.rr(P*P.T)
    #%Overdetermined case
    elif P.shape[0] > P.shape[1]:
        Ainv = linalg_inv_rr.rr(P.T*P)*P.T
    else:
        Atest = P

    #Augments the original matrix with the identity matrix
    A = concatenate((Atest,eye(Atest.shape[0],Atest.shape[1])),1)

    #This will normalize all of the rows to the largest number in the first
    #column
    # maxValue = max(A(:,1))
    # for k = 1:(size(A,1)-1)
    #     A(k,:) = A(k,:).*(maxValue/(A(k,1)))
    # end

    #This is the first step of gaussian elimination, eliminating the bottom
    #terms
    for k in arange(1,A.shape[0]-1):
        for l in arange(k+1,A.shape[0]):
            maxValue = A[l,k]/A[k,k]
            A[l,:] =  -1*multiply(A[k,:],maxValue) + A[l,:]

    #This is the second step of gaussian elimination, eliminating the top terms
    for k in arange(P.shape[0]-1,2,-1):
        for l in arange(k-1,1,-1):
            maxValue = A[l,k]/A[k,k]
            A[l,:] =  -1*multiply(A[k,:],maxValue) + A[l,:]
        

    #This will normalize the matrix on the left into the identity matrix
    for i in arange(1,A.shape[0]):
        A[i,:] = A[i,:]/A[i,i]

    #This will take the identity matrix out and just leave the inverse
    Ainv = A[:,A.shape[0]:A.shape[1]]

    return Ainv
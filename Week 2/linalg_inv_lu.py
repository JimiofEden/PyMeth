from numpy import *
import PartialPivot
import linalg_lu
import linalg_inv_rr

def lu(matIn):
    '''
    %% ***********************************************************************
    % FUNCTION linalg_inv_lu
    % Purpose: Calculates the inverse of a matrix using LU methods.
    % Additionally will check if the matrix is square, and will return the
    % pseudoinverse, if not.
    %
    % Function call: [Ainv] = linalg_inv_lu(A)
    %
    % Input: A = Input matrix to be inverted
    %
    % Outputs: Ainv = the inverted matrix
    %
    % Adam Hollock
    % 24 January 2012
    %% ***********************************************************************
    '''
    #This will take the pseudoinverse in case the matrix in question is not
    #square.
    #Underdetermined case
    if (matIn.shape[0] < matIn.shape[1]):
        Atest = matIn.T*linalg_inv_lu.lu(matIn*matIn.T)
    #Overdetermined case
    elif (matIn.shape[0] > matIn.shape[1]):
        Atest = linalg_inv_lu.lu(matIn.T*matIn)*matIn.T
    else:
        Atest = matIn

        print Atest

    #Calculates the L and U matrices
        [L, U, P] = linalg_lu.lu(Atest)
    #Finds the inverse of the L and U matrices using the premade RR methods.
        Linv = linalg_inv_rr.rr(L)
        Uinv = linalg_inv_rr.rr(U)

    #Initializes AinvTemp, Ainv and D matrices, as well as a general purpose identity
    #matrix.
        AinvTemp = zeros(Atest.shape)
        D = zeros(Atest.shape)
        ident = eye(Atest.shape)
        Ainv = zeros(Atest.shape)
        
        for i in arange(1,Atest.shape[1]):
            D[:,i] = Linv*ident[:,i]
            AinvTemp[:,i] = Uinv*D[:,i]
        
        #This reorganizes the matrix in accordance with the change in P.
        for i in range(1,P.shape[0]):
            Ainv[:,i] = AinvTemp[:,nonzero(P[:,i]==1)]
from numpy import *
import eig_power

def eqr(A):
    '''
    %% ***********************************************************************
    % FUNCTION eigen_qr
    % Purpose: Finds the eigenvalues and eigenvectors of a given matrix using
    % the QR method
    %
    % Function call: [eigVal, eigVect, counter] = eigen_qr(A, guess, eps)
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

    #initializes all matrices to be used in the method
    e_matrix = eye(A.shape[1])
    for i in arange(1,e_matrix.shape[1],2):
        e_matrix[i,:] = e_matrix[i,:]*-1

    #Performs the QR factorization method for obtaining an upper triangular
    #matrix.
    for i in arange(0,A.shape[1]):
        #This will make a special case for the first iteration
        if i == 0:
            #Builds the c vector as needed
            c_vector = A[:,i]
        else:
            #Builds the c vector as needed
            c_vector = concatenate((zeros((i,1)),r_matrixNew[i:,i]))

        c_norm = linalg.norm(c_vector,2)
        v = c_vector+c_norm*e_matrix[:,i].reshape(A.shape[0],1)
        house = (eye(A.shape[1]) - multiply((2/(v.T*v)),(v*v.T)))
        #This will make a special case for the first iteration
        if i == 0:
            #Builds the Householder matrix
            q_matrixNew = house
            r_matrixNew = house*A
        else:
            #Builds the Householder matrix
            q_matrixOld = q_matrixNew
            r_matrixOld = r_matrixNew
            
            q_matrixNew = q_matrixOld*house
            r_matrixNew = house*r_matrixOld

    A_qr = q_matrixNew*r_matrixNew;
    eigVal, eigVect = eig_power.epower(A_qr);
    return eigVal, eigVect

function [A_qr, eigVal, eigVect] = eigen_qr(A)
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


%initializes all matrices to be used in the method
e_matrix = eye(size(A,2));
for i = 2:2:size(e_matrix,2)
    e_matrix(i,:) = e_matrix(i,:)*-1;
end

%Performs the QR factorization method for obtaining an upper triangular
%matrix.
for i = 1:size(A,2)-1
    %This will make a special case for the first iteration
    if i == 1
        %Builds the c vector as needed
        c_vector = A(:,i);
    else
        %Builds the c vector as needed
        c_vector = cat(1,zeros(i-1,1),r_matrixNew(i:end,i));
    end
    c_norm = norm(c_vector,2);
    v = c_vector+c_norm*e_matrix(:,i);
    house = (eye(size(A,2)) - (2./(v.'*v))*(v*v.'));
    %This will make a special case for hte first iteration
    if i == 1
        %Builds the Householder matrix
        q_matrixNew = house;
        r_matrixNew = house*A;
    else
        %Builds the Householder matrix
        q_matrixOld = q_matrixNew;
        r_matrixOld = r_matrixNew;
        
        q_matrixNew = q_matrixOld*house;
        r_matrixNew = house*r_matrixOld;
    end
end

A_qr = q_matrixNew*r_matrixNew;
[eigVal, eigVect] = eig_power(A_qr);

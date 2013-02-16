function [Ainv] = linalg_inv_lu(matIn)
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
%This will take the pseudoinverse in case the matrix in question is not
%square.
if size(matIn,1) < size(matIn,2)            %Underdetermined case
    Ainv = matIn.'*linalg_inv_lu(matIn*matIn.');
elseif size(matIn,1) > size(matIn,2)        %Overdetermined case
    Ainv = linalg_inv_lu(matIn.'*matIn)*matIn.';
else
    Atest = matIn;

% Calculates the L and U matrices
    [L, U, P] = linalg_lu(Atest);
% Finds the inverse of the L and U matrices using the premade RR methods.
    Linv = linalg_inv_rr(L);
    Uinv = linalg_inv_rr(U);

% Initializes AinvTemp, Ainv and D matrices, as well as a general purpose identity
% matrix.
    AinvTemp = zeros(size(Atest));
    D = zeros(size(Atest));
    ident = eye(size(Atest));
    Ainv = zeros(size(Atest));
    
    for i=1:size(Atest,2)
        D(:,i) = Linv*ident(:,i);
        AinvTemp(:,i) = Uinv*D(:,i);
    end
    
    %This reorganizes the matrix in accordance with the change in P.
    for i = 1:size(P,1)
        Ainv(:,i) = AinvTemp(:,find(P(:,i)==1));
    end
end
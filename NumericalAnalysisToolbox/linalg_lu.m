function [L, U, P] = linalg_lu(A)
%% ***********************************************************************
% FUNCTION linalg_lu
% Purpose: Breaks a matrix A into a lower diagonal matrix, an upper
% diagonal matrix, and a permutation matrix.
%
% Function call: [L, U, P] = linalg_lu(A)
%
% Input: A = Input matrix to be broken down. Coefficients of x of system of
%   equations
% b = solutions to the system of equations
%
% Outputs: L = lower diagonal matrix
% U = upper diagonal matrix
% P = Permutation matrix
%
% Adam Hollock
% 24 January 2012
%% ***********************************************************************
%This will ensure a square matrix
if size(A,1) ~= size(A,2)
    error('When someone asks you: are you a god, you say yes!');
end

%Augments the original matrix with teh identity matrix
Aaug = cat(2,A,eye(size(A)));

%Performs partial pivoting
Ause = PartialPivot(Aaug);

%Initializes L and P matrix
L = zeros(size(A));
P = Ause(:,size(Ause,1)+1:end);
U = Ause(1:end,1:size(A,2));

%Performs the first step of gaussian elimination, as well as gathers the
%necessary factors for the L and the U matrix.
for k=1:(size(U,1)-1)
    for l=k+1:size(U,1)
        L(l,k) = U(l,k)/U(k,k);
        U(l,:) =  -1*U(k,:).*L(l,k) + U(l,:);
    end
end

%Adds the identity matrix to get a diagonal of ones.
L = L + eye(size(L));
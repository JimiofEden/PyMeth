function [eigVal, eigVect, counter] = eig_power(A, guess, eps)
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

%sets up a large error for initialization & initializes counter
error = 10000*ones(size(A,1),1);
counter = 0;

if nargin < 2
    %If no guess is entered, an array of ones will be used
    guess = ones(size(A,1),1);
    if nargin < 3
        %If no tolerance is input, 1e-6 will be used
        eps = 1e-6;
    end
end

while max(error) > eps
    eigVal = max(guess);
    newGuess = ((A*guess)./eigVal);
    for i = 1:size(guess,1)
        error = norm(newGuess(i) - guess(i),Inf);
    end
    guess = newGuess;
    counter = counter + 1;
end

eigVal = max(guess);
eigVect = guess/eigVal;
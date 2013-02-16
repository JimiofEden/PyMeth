function [x, count] = GaussSeidel(A,b,guess,eps,lam,maxit)
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
if nargin < 3
    %Will set the guess to a vector of zeros if nothing is initialized
    guess = zeros(size(A,1),1);
    if nargin < 4
        %Will set the error threshold to 1x10^-6 if nothing is initialized
        eps = 1e-2;
        if nargin < 5
            %Will set the relaxation constant to 1 if nothing is
            %initialized
            lam = 1;
            if nargin < 6
                %Will set the maximum number of iterations to 10000 if
                %nothing is initialized
                maxit = 10000;
            end
        end
    end
end

%Will catch the matrix if the number of variables don't match the number of
%solutions or the size of the system in general
if size(A,2) ~= size(b,1) || size(A,1) ~= size(guess,1)
    error('Great Scott!!!')
end

%initializes an error matrix, an x matrix, and a counter.
errorValues = ones(size(guess,1),1);
x = guess;
count = 0;

%Begins the gauss seidel solver algorithm
while (max(errorValues) > eps) && (maxit > count)
    %initializes a solution matrix.
    xnew = x;
    for i = 1:size(guess,1)
        %Performs the main mathematical work of the gauss-seidel function.
        xnew(i) = (b(i)-A(i,[1:i-1,i+1:end])*xnew([1:i-1,i+1:end]))/(A(i,i));
        %Applies the relaxation constant
        xnew(i) = lam*xnew(i) + (1-lam)*x(i);
        errorValues(i) = abs((xnew(i)-x(i))/xnew(i))*100;
    end
    x = xnew;
    count = count + 1;
end
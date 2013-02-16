close all
clear all
clc
format long
%% ***********************************************************************
% Homework 3 File
% Purpose: This file compiles all of the homework answers to be published
% in a tidy html format.
%
% Adam Hollock
% 26 January 2012
%% Problem 1
%Consider the set of equations:
A_1 = [3 0 -8; 5 3 2; 4 4 -8];
B_1 = [4;-3;10];
%Use the Gauss-Seidel method to solve the problem, maximum 300 iterations
%and a relative tolerance of 0.01%. Use the realaxation value of 0.5
%I added in a guess of:
guess_1 = [1;1;1];
eps_1 = 0.01/100;
lam_1 = 0.5;
maxit_1 = 300;

[x_1, count_1] = GaussSeidel(A_1,B_1,guess_1,eps_1,lam_1,maxit_1)

%% ***********************************************************************

%% Problem 2
%Repeat problem 1, only with rows 1 and 2 switched. Do you notice any
%difference, and if so, why?
A_2 = [5 3 2; 3 0 -8; 4 4 -8];
B_2 = [-3;4;10];

guess_2 = guess_1;
eps_2 = eps_1;
lam_2 = lam_1;
maxit_2 = maxit_1;

[x_2, count_2] = GaussSeidel(A_2,B_2,guess_2,eps_2,lam_2,maxit_2)

%Yes, there is a large difference, since this puts a zero on the diagonal.

%% ***********************************************************************

%% Problem 3
%Repeat problem 1 using Jacobi iteration. Do you have to change the
%relaxation value to yield proper result? If so, what is the value?
A_3 = A_1;
B_3 = B_1;

guess_3 = guess_1;
eps_3 = eps_1;
lam_3 = lam_1;
maxit_3 = maxit_1;

[x_3, count_3] = Jacobi(A_3,B_3,guess_3,eps_3,lam_3,maxit_3)
[x_3, count_3] = Jacobi(A_3,B_3,guess_3,eps_3,lam_3-0.3,maxit_3)
%Yes, I had to change the value to 0.2. It
%still takes a full 300 iterations, but now converges to the proper
%solution.

%% ***********************************************************************

%% Problem 4
%Repeat problem 1 using Gauss-Seidel for relaxion values of 0.1 to 0.9, in
%0.05 increments. Produce the following plots
%a. x1 vs. the relaxation value
%b. x2 vs. the relaxation value
%c. x3 vs. the relaxation value
%d. Number of iterations vs. the relation value

A_4 = [3 0 -8; 5 3 2; 4 4 -8];
B_4 = [4;-3;10];
guess_4 = [1;1;1];
eps_4 = 0.01/100;
lam_4 = 0.5;
maxit_4 = 300;

relaxValues = 0.1:0.05:0.9;
x_4 = zeros(size(relaxValues,2),3);
count_4 = zeros(size(relaxValues,2),1);

for i = 1:size(relaxValues,2)
    [x_4(i,:), count_4(i)] = GaussSeidel(A_4,B_4,guess_4,eps_4,relaxValues(i),maxit_4);
end

figure(1)
plot(relaxValues, x_4(:,1), 'r')
figure(2)
plot(relaxValues, x_4(:,2), 'r')
figure(3)
plot(relaxValues, x_4(:,3), 'r')
figure(4)
plot(relaxValues, count_4(:), 'r')

%% ***********************************************************************

%% Problem 5
%Consider the set of equations
% 3*x1 + x1*x2 + x1*x3 = 10
% -2*(x1^2) + 3*(x2^2)*x3 - 7*x3 = 5
% 4*x1*x2 + 5*x1*x3 - 9*(x3^2) = -2
% Solve the system of nonlinear equations using successive substitution.
f5_1 = @(x1, x2, x3) 3*x1 + x1.*x2 + x1.*x3 - 10;
f5_2 = @(x1, x2, x3) -2*x1.^2 + 3*x2.^2.*x3 + 7*x3 - 5;
f5_3 = @(x1, x2, x3) 4*x1.*x2 + 5*x1.*x3 - 9*x3.^2 + 2;

%Sets up epsilon error tolerance
eps = 1e-6;
error = [10000;10000;10000];

%Sets up initial guesses
guess = [1;1;1];

%sets up a relaxation constant
lam = 1;

%approach 1, factor out x1, x2 and x3
%x1 factored out
f5_1_1 = @(x2, x3) (10)/(3 + x2 + x3);
%x3 factored out
f5_2_1 = @(x1, x2) (5 + 2*x1.^2)./(3*x2.^2 + 7);
%x2 factored out
f5_3_1 = @(x1, x3) (-2 - 5*x1.*x3 + 9*x3.^2)./(4*x1);

%will perform two iterations
for d = 1:2
%Plugs in the guesses
    x = [f5_1_1(guess(2),guess(3));f5_2_1(guess(1),guess(2));f5_3_1(guess(1),guess(3))];
    %Applies a relaxation constant
    for i = 1:length(error)
        guess(i) = lam*x(i) + (1-lam)*guess(i);
        error(i) = abs((abs(x(i)) - abs(guess(i)))/abs(x(i)));
    end
    %prepares for the next iteration
    guess = x
end
x
%It can be seen that this does not converge properly

%approach 2,
%x3 factored out
f5_1_2 = @(x1, x2) (10 - 3*x1 - x1.*x2)/(x1);
%x2 factored out
f5_2_2 = @(x1, x3) sqrt((5+2*x1.^2 - 7*x3)./(3*x3));
%x1 factored out
f5_3_2 = @(x2, x3) (-2 + 9*x3.^2)./(4*x2 + 5*x3);

%Sets up epsilon error tolerance
eps = 1e-6;
error = [10000;10000;10000];

%Sets up initial guesses
guess = [1;1;1];

%will perform two iterations
for d = 1:2
    %Plugs in the guesses
    x = [f5_1_2(guess(2),guess(3));f5_2_2(guess(1),guess(2));f5_3_2(guess(1),guess(3))];
    %Applies a relaxation constant
    for i = 1:length(error)
        guess(i) = lam*x(i) + (1-lam)*guess(i);
        error(i) = abs((abs(x(i)) - abs(guess(i)))/abs(x(i)));
    end
    %prepares for the next iteration
    guess = x;
end
x
%It can be seen that this does not converge properly, either

%% ***********************************************************************

%% Problem 6
%Solve the system of nonlinear equations in problem 5 using Newton Raphson
f6_1 = @(x1, x2, x3) 3*x1 + x1.*x2 + x1.*x3 - 10;
f6_2 = @(x1, x2, x3) -2*x1.^2 + 3*x2.^2.*x3 + 7*x3 - 5;
f6_3 = @(x1, x2, x3) 4*x1.*x2 + 5*x1.*x3 - 9*x3.^2 + 2;

%Sets up the derivatives
J{1,1} = @(x1, x2, x3) 3 + x2 + x3;
J{1,2} = @(x1, x2, x3) x1;
J{1,3} = @(x1, x2, x3) x1;
J{2,1} = @(x1, x2, x3) -4*x1;
J{2,2} = @(x1, x2, x3) 6*x2.*x3;
J{2,3} = @(x1, x2, x3) 3*x2.^2 + 7;
J{3,1} = @(x1, x2, x3) 4*x2 + 5*x3;
J{3,2} = @(x1, x2, x3) 4*x1;
J{3,3} = @(x1, x2, x3) 5*x1 - 18*x3;

%Sets up epsilon error tolerance
eps = 1e-6;
error = [10000;10000;10000];

%Sets up initial guesses
guess = [1;1;1];
lam = 0.5;

while max(error) > eps
    test = guess';
    Juse = zeros(size(J));
    for ii = 1:3
        for kk = 1:3
            Juse(ii,kk) = J{ii,kk}(guess(1),guess(2),guess(3));
        end
    end
    %plugs in the guesses to the equation
    x = guess - inv(Juse)*[f6_1(guess(1),guess(2),guess(3));f6_2(guess(1),guess(2),guess(3));f6_3(guess(1),guess(2),guess(3))];
    for i = 1:length(error)
        guess(i) = lam*x(i) + (1-lam)*guess(i);
        error(i) = abs((abs(x(i)) - abs(guess(i)))./abs(x(i)));
    end
    guess = x;
end

x
%% ***********************************************************************
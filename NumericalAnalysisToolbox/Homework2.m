close all
clear all
clc
format long
%% ***********************************************************************
% Homework 1 File
% Purpose: This file compiles all of the homework answers to be published
% in a tidy html format.
%
% Adam Hollock
% 15 January 2012
%% Problem 1
%Calculate the solution set x for the following set of equations:
A_1 = [6  3  9  9; 8 -8  9  0; -7 -4 -7  6; 8  1  9 -7];
B_1 = [-3; -17; 12; 8];

%Solve it by using 3 methods:
%1) Calculating the inverse using row reduction operations:
[Ainv_1_1] = linalg_inv_rr(A_1);
X_1_1 = Ainv_1_1*B_1

%2) Calculating the inverse using LU factorization:
[Ainv_1_2] = linalg_inv_lu(A_1);
X_1_2 = Ainv_1_2*B_1

%Using the MATLAB inv command.
[Ainv_1_3] = inv(A_1);
X_1_3 = Ainv_1_3*B_1

%Comment on your results
%It can be seen that the results are nearly the same up until an
%unnecessarily small number of digits for our purposes.
%The only issues that may come into play is for extreme precision
%measurements.

%% ***********************************************************************

%% Problem 2
%Calculate the minimum-norm solution sex x for the following set of
%equations
A_2 = [6  3  9  9; 8 -8  9  0; -7 -4 -7  6];
B_2 = [-3; -17; 12];

%Solve it by using one of the functions you developed.
[Ainv_2_1] = linalg_inv_rr(A_2);
X_2_1 = Ainv_2_1*B_2

%Compare the results to matlab's pinv command (or use the \ operator).
[Ainv_2_2] = pinv(A_2);
X_2_2 = Ainv_2_2*B_2

%Compare your results
%It can be seen that the results are again similar to a very low decimal 
%value.

%Do the results yield the right hand side of the equations when plugged
%back in?
B_2_1 = A_2*X_2_1
B_2_2 = A_2*X_2_2
%Yes, both of the results are very nearly the same with precision issues, as usual

%% ***********************************************************************

%% Problem 3
%Calculate the least-squares solution set x for the following set of
%equations
A_3 = [6  3  9  9; 8 -8  9  0; -7 -4 -7  6; 8  1  9 -7; 10 8 -5 -7];
B_3 = [-3; 17; 12; 8; 15];

%Solve it by using one of the functions you developed.
[Ainv_3_1] = linalg_inv_lu(A_3);
X_3_1 = Ainv_3_1*B_3

%Compare the results to matlab's pinv command (or use the \ operator).
[Ainv_3_2] = pinv(A_3);
X_3_2 = Ainv_3_2*B_3

%Compare your results
%It can be seen that the results are again similar to a very low decimal 
%value.

%Do the results yield the right hand side of the equations when plugged
%back in?
B_3_1 = A_3*X_3_1
B_3_2 = A_3*X_3_2
%No, the results are different, however, each one is similar to the other.

%% ***********************************************************************

%% Problem 4
%Solve the same equation set in (1) using Cramer's rule
A_4 = [6  3  9  9; 8 -8  9  0; -7 -4 -7  6; 8  1  9 -7];
B_4 = [-3; -17; 12; 8];

X_4 = zeros(size(A_4,1),1);
for i = 1:size(A_4,1)
    A_4temp = A_4;
    A_4temp(:,i) = B_4;
    X_4(i) = linalg_determ_recursive(A_4temp)/linalg_determ_lu(A_4);
end

X_4
%% ***********************************************************************

%% Problem 5
%Solve the same equation set in (1) using Gaussian elimination using
%partial pivoting
A_5 = [6  3  9  9; 8 -8  9  0; -7 -4 -7  6; 8  1  9 -7];
B_5 = [-3; -17; 12; 8];

X_5 = linalg_pivot(A_5,B_5)
%% ***********************************************************************

%% Problem 6
%This is a comparison of the methods used to determine the efficiency of
%the different approaches to calculate the determinant of a square matrix.
%Calculate the time it takes to calculate random matrices ranging in size
%from 2x2 to 10x10 using both the iterative technique and hte LU
%factorization approach. Use tic and toc to get the elapsed time. Plot the
%results on the same graph (elapsed time vs. matrix order(size)).

matrixSizes = 2:10;
recursive_time = zeros(1,size(matrixSizes,2));
lu_time = zeros(1,size(matrixSizes,2));

for i = matrixSizes
    A_6 = rand(i,i);
    
    %Calculates the iterative method determinant
    tic
    linalg_determ_recursive(A_6);
    recursive_time(i-1) = toc;
    
    %Calculates the LU factorization determinant
    tic
    linalg_determ_lu(A_6);
    lu_time(i-1) = toc;
    
end
recursive_time
lu_time
figure(1)
plot(matrixSizes, recursive_time, 'r')
hold on
plot(matrixSizes, lu_time, 'b')

%% ***********************************************************************
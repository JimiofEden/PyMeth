close all
clear all
clc
format long
%% ***********************************************************************
% Homework 4 File
% Purpose: This file compiles all of the homework answers to be published
% in a tidy html format.
%
% Adam Hollock
% 5 February 2012
%% Problem 1
% Write a function, called eig_power, which calculates the eigenvalues and
% eigenvectors of a matrix using the power method.
% See eig_power.m included.

%% ***********************************************************************

%% Problem 2
% Use this function to calculate the eigenvalues and eigenvectors of the
% matrix:
A_2 = [3 1 7; 2 9 3; 6 1 4];
%Compare your answers with MATLAB. Comment on any differences.
[eigVal_2, eigVect_2] = eig_power(A_2)
V_2 = eig(A_2)

%It can be seen that there are differences in that the matlab computed
%eigenvalue has a negative number as a value, as well as isn't
%automatically normalized. This second issue can be solved as:
V_2 = eig(A_2)/(max(eig(A_2)))

%% ***********************************************************************

%% Problem 3
% Repeat the same process as in problem 2, but for the matrix
A_3 = [-23 57 -9 -15 -59; -10 12 -10 2 -22; 11 5 -3 -19 -15; -27 31 -27 ...
    25 -37; -5 -15 -5 1 31];
% Compare your answers to MATLAB. Comment on any differences
[eigVal_3, eigVect_3] = eig_power(A_3)
V_3 = eig(A_3)

%It can be seen that there are differences in that the matlab computed
%eigenvalue has a negative number as a value, as well as isn't
%automatically normalized. This second issue can be solved as:
V_3 = eig(A_3)/(max(eig(A_3)))

%% ***********************************************************************

%% Problem 4
% Repeat the same process as in problem 2, but for the matrix
A_4 = [3 2 1; 9 2 3; 6 4 2];

%Compare your answers to MATLAB. Comment on any differences. Describe why
%there is a problem with evaluating this matrix using the power method.
[eigVal_4, eigVect_4] = eig_power(A_4)
V_4 = eig(A_4)

%It can be seen that there are differences in that the matlab computed
%eigenvalue has a negative number as a value, as well as isn't
%automatically normalized. This second issue can be solved as:
V_4 = eig(A_4)/(max(eig(A_4)))

%The issue with solving this matrix's eigenvalues is that the matrix is
%singular, and thus causes issues when solving the power equations.

%% ***********************************************************************

%% Problem 5
%To correct the problem that occurred in problem 4, write a function called
%eigen_qr to solve this kind of a problem. You first need to obtain the
%eigenvalues using the QR method. Then, using these eigenvalues, find the
%corresponding eigenvectors using either the power or inverse power method.
A_5 = [3 2 1; 9 2 3; 6 4 2];

[A_qr, eigVal, eigVect] = eigen_qr(A_5)

%% ***********************************************************************
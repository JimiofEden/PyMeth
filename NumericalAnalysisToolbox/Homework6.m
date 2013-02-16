close all
clear all
clc
format long
%% ***********************************************************************
% Homework 7 File
% Purpose: This file compiles all of the homework answers to be published
% in a tidy html format.
%
% 
% Adam Hollock
% 5 March 2012
%% Problem 1
% Evaluate the following integrals using functions 1-4 for each integral
f1_1 = @(x) 4*exp(-sqrt(x));
a1_1 = 1;
b1_1 = 5;

f1_2 = @(x) 9*x.^2.*exp(-sqrt(x));
a1_2 = 1;
b1_2 = 10;

f1_3 = @(x) 7*x.^2.*sin(0.27*x)
a1_3 = -2;
b1_3 = 3;
samples = 20
%Integral 1, wolfram alpha gives the answer as 3.11916
integral1_1_1 = int_newton(f1_1,a1_1,b1_1)
integral1_1_2 = int_trap(f1_1,a1_1,b1_1,samples)
integral1_1_3 = int_simp(f1_1,a1_1,b1_1,samples+1)
integral1_1_4 = int_richardson(f1_1,a1_1,b1_1)

%Integral 2, wolfram alpha gives the answer as 217.21
integral1_2_1 = int_newton(f1_2,a1_2,b1_2)
integral1_2_2 = int_trap(f1_2,a1_2,b1_2,samples)
integral1_2_3 = int_simp(f1_2,a1_2,b1_2,samples+1)
integral1_2_4 = int_richardson(f1_2,a1_2,b1_2)

%Integral 3, wolfram alpha gives the answer as 28.2325
integral1_3_1 = int_newton(f1_3,a1_3,b1_3)
integral1_3_2 = int_trap(f1_3,a1_3,b1_3,samples)
integral1_3_3 = int_simp(f1_3,a1_3,b1_3,samples+1)
integral1_3_4 = int_richardson(f1_3,a1_3,b1_3)

%% ***********************************************************************

%% Problem 2
% Calculate the integrals using functions 5-9 (use the appropriate method
f2_1 = @(x) 2*x.^5 - 3*x.^4 + 8*x.^2 - 6*x - 8;
a2_1 = -3;
b2_1 = 5;

f2_2 = @(x) exp(-9*x.^2);
a2_2 = -1;
b2_2 = 1;
f2_3 = @(x) x.^2.*exp(-9*x.^2);

f2_4 = @(x) x.^2./(exp(x)-1);

f2_5 = @(x) (x.^4)./(sqrt(1-x.^2));

f2_6 = @(x) x.^2.*sqrt(1-x.^2);

%Integral 1, wolfram alpha gives the answer as 3237.87
integral2_1 = int_gauss_legendre(f2_1,a2_1,b2_1,5)

%Integral 2, wolfram alpha gives the answer as 0.590818
%integral2_2 = int_gauss_hermite(f2_2,a2_2,b2_2,5)

%Integral 3, wolfram alpha gives the answer as 0.0164116

%Integral 4, wolfram alpha gives the answer as 2.40411

%Integral 5, wolfram alpha gives the answer as 1.1781

%Integral 5, wolfram alpha gives the answer as 0.392699

%% ***********************************************************************
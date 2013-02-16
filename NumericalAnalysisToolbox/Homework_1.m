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
% Write MATLAB functions to solve for the roots of a function. You
% must write individual functions for each of the following methods:
% (All problems were verified via the lecture notes.)
%% Part a) Incremental
f = @(x) x.^3+2*x.^2 - 5*x - 6, -4;
results = roots_Incremental(f, -4, 4, 50)
results = roots_Incremental(f, -4, 4, 300)
results = roots_Incremental(f, -4, 4, 301)
roots([1 2 -5 -6])                                              %Comparison

%% Part b) Modified secant
f=@(x) x^3-(3541*x^2)/2500- (48741701*x)/5000000 + 41249804989/2500000000;

results = roots_ModifiedSecant(f,-2.5,1e-6,5e-6)
results = roots_ModifiedSecant(f,1.5,1e-6,5e-6)
results = roots_ModifiedSecant(f,4,1e-6,5e-5)
roots([1 -3541/2500 -48741701/5000000 41249804989/2500000000])  %Comparison

%% Part c) Bisection
f=@(x) x.^3+2*x.^2-5*x-6;
results = roots_Bisection(f,-3.8,-2.8,.05)
results = roots_Bisection(f,-1.3,-0.9,.05)
results = roots_Bisection(f,1.8,2.3,.05)
roots([1 2 -5 -6])                                              %Comparison

%% Part d) Fixed point
f=@(x) exp(-x)-x;
g=@(x) exp(-x);
results = roots_FixedPoint(f,g,0,.05)
abs(log(results))                                       %Test for this case

%% part e) False position
f = @(x) x.^3+2.^2-5*x-6;
results = roots_FalsePosition(f,-3.8,-2.8,0.05)
results = roots_FalsePosition(f,-1.3,-0.9,0.05)
results = roots_FalsePosition(f,1.8,2.3,0.05)
roots([1 2 -5 -6])                                              %Comparison

%% part f) Newton Raphson
f = @(x) 3-2*exp(x);
df = @(x) -2*exp(x);
results = roots_NewtonRaphson(f,df,0,0.05)

%% ***********************************************************************

%% Problem 2
% Determine the roots of the following functions both graphically and using
% each of the functions in problem 1 (assume a 0.1% relative error stopping
% criteria), along with the number of iterations.
%% Part a) 
f = @(x) x.^2 - 3*x - 1;
g = @(x) (x.^2 - 1)/(3);
df =@(x) 2*x - 3;
ezplot(f)
% Zooming in while using ezplot simply shows the roots
incrementalRoots = roots_Incremental(f, -5, 5, 100)
%The incremental method shows similar answers to the actual positive roots below, with
%an error due to bin size.
secantRoots = roots_ModifiedSecant(f,3,1e-6,0.1)
secantRoots = roots_ModifiedSecant(f,-3,1e-6,0.1)
%The Modified Secant method returns a proper result, depending on the
%guess.
bisectionRoots = roots_Bisection(f,0,4,.1)
bisectionRoots = roots_Bisection(f,-4,0,.1)
%The bisection method works depending on the initial brackets
fixedRoots = roots_FixedPoint(f,g,3,.05)
fixedRoots = roots_FixedPoint(f,g,-4,.05)
%This method gets the proper postitive root, however, shoots off when
%searching for the negative root. This is due to the nature of the fixed
%point method.
falseRoots = roots_FalsePosition(f,-3.8,-2.8,0.05)
falseRoots = roots_FalsePosition(f,0,4.8,0.05)
%The false position method obtains the proper roots, depending on the
%bracket used.
newtonRoots = roots_NewtonRaphson(f,df,3,0.05)
newtonRoots = roots_NewtonRaphson(f,df,-3,0.05)
%The Newton Raphson method gets the proper roots, depending on the initial
%guess.
realRoots = roots([1 -3 -1])

%% Part b)
f = @(x) x.^3 - x.^2 + 1;
g = @(x) sqrt(x.^3 + 1);
df =@(x) 3*x.^2 - 2*x;
%As a warning, this problem has imaginary roots, and causes an issue with
%some of the solvers developed. The real roots are returned successfully,
%however.
ezplot(f)
% Zooming in while using ezplot simply shows the roots
incrementalRoots = roots_Incremental(f, -5, 5, 100)
%The incremental method shows similar answers to the real root below.
secantRoots = roots_ModifiedSecant(f,3,1e-6,0.1)
%The Modified Secant method returns a proper real result
bisectionRoots = roots_Bisection(f,-4,4,.1)
%The bisection method works depending on the initial brackets
fixedRoots = roots_FixedPoint(f,g,3,.1)
%This method does not work, due to the nature of the fixed point method.
falseRoots = roots_FalsePosition(f,-3.8,-2.8,0.1)
%The false position method obtains the proper root
newtonRoots = roots_NewtonRaphson(f,df,3,0.1)
%The Newton Raphson method gets the proper roots.
realRoots = roots([1 -1 0 1])

%% Part c)
f = @(x) 3*x.^8 - 1;
g = @(x) (-1/3)^(1/8);
df = @(x) 24*x.^7;
%As a warning, this problem has imaginary roots, and causes an issue with
%some of the solvers developed. The real roots are returned successfully,
%however.
%Another note is that all of the solvers return -0.755 as a root, but the
%roots equation itself gives two real roots, 0.872 and -0.872.
ezplot(f)
% Zooming in while using ezplot simply shows the roots
incrementalRoots = roots_Incremental(f, -2, 0, 100)
incrementalRoots = roots_Incremental(f, 0, 2, 100)
%The incremental method shows similar answers to the negative real root below.
%however, does not seem to be able to display the positive real root.
secantRoots = roots_ModifiedSecant(f,3,1e-6,0.1)
%The Modified Secant method returns a proper real result
bisectionRoots = roots_Bisection(f,-4,4,.1)
%The bisection method works depending on the initial brackets
fixedRoots = roots_FixedPoint(f,g,3,.1)
%This method does not work, due to the nature of the fixed point method.
falseRoots = roots_FalsePosition(f,-3.8,-2.8,0.1)
%The false position method does not return the proper roots due to the
%shape of the curve.
newtonRoots = roots_NewtonRaphson(f,df,3,0.1)
%The Newton Raphson method gets the proper roots.
realRoots = roots([3 0 0 0 0 0 0 0 -1])

%% ***********************************************************************

%% Problem 3
% Problem 5.5:
% Determine the roots of f(x) = -12-21*x+18*x.^2-2.75*x.^3 graphically. In
% addition, determine the first root of the function with bisection and
% false position. Use initial guesses of xl = -1, xu = 0, and a stopping
% criterion of 1%.
f = @(x) -12-21*x+18*x.^2-2.75*x.^3;
ezplot(f)
% Graphically, the roots are seen as:
% -0.4146, 2.2198, 4.7403
bisectionRoots = roots_Bisection(f,-1,0,.1)
% This gives the first root as proper.
falseRoots = roots_FalsePosition(f,-1,0,0.1)
% This also gives the proper first root

%% ***********************************************************************

%% Problem 4
% Problem 5.19:
% Mechanical engineers, as well as most other engineers, use thermodynamics
% extensively in their work. The following polynomial can be used to relate
% the zero-pressure specific heat of dry air cp (in kJ/(kg-K)) to
% temperature (K):
% cp = 0.99403 + (1.671e-4)*x + (9.7215e-8)*x.^2 - (9.5838e-11)*x.^3 + (1.925e-14)*x.^4
% Develop a plot of cp versus a range of T = 0 to 1200 and then use
% bisection to determine the temperature that corresponds to a specific
% heat of 1.1 kJ/(kg-K).
f = @(x) 0.99403 + (1.671e-4)*x + (9.7215e-8)*x.^2 - (9.5838e-11)*x.^3 + (1.925e-14)*x.^4
ezplot(f,[0,1200])
bisectionRoots = roots_Bisection(f,-2,2,1e-6)
% This does not seem to give the proper root, as the plot never seems to go
% negative anywhere near 1.1.

%% ***********************************************************************

%% Problem 5
% Problem 6.5:
% Use the Newton-Raphson method and the Modified Secant method to determine
% a root of:
% f(x) = x.^5 - 16.05*x.^4 + 88.75*x.^3 - 192.0375*x.^2 + 116.35*x + 31.6875
% Use an initial guess of x=0.5825 and epsilon=0.01%. Explain
f = @(x) x.^5 - 16.05*x.^4 + 88.75*x.^3 - 192.0375*x.^2 + 116.35*x + 31.6875;
df = @(x) 5*x.^4 - (16.05*4)*x.^3 + (88.75*3)*x.^2 - (192.0375*2)*x + 116.35;
newtonRoots = roots_NewtonRaphson(f,df,0.5825,0.0001)
secantRoots = roots_ModifiedSecant(f,0.5825,0.05,0.0001)
roots([1 -16.05 88.75 -192.0375 116.35 31.6875])                %Comparison

%% ***********************************************************************

%% Problem 6
% Problem 6.18:
% An oscillating current in an electric circuit is described by:
% I = 9*exp(-t)*sin(2*pi*t)
% where t is in seconds. Determine all values of t such that I = 3.5.
f = @(x) 9*exp(-x).*sin(2*pi*x);
ezplot(f, [0,5])
x = 0:0.01:5;
I = 9*exp(-x).*sin(2*pi*x);
find(I<3.6 & I>3.4)*0.01
%The function hits 3.5 at t = 0.08 and 0.41 s

%% ***********************************************************************

%% Problem 7
% Develop a hybrid algorithm (DO NOT use Brent's algorithm) that will quickly find as many
% roots of a function over the range of interest as possible. In other words, some methods yield the
% regions of where roots are located, and some yield the "exact" answer. Test your algorithm out,
% repeating Problem 2 and for the following function over the region x=-5 to 5:
% f(x) = sin(x)- 3*cos(x.^2)+ 2*(sin(x)).^2
% Justify the reasoning on your development of the algorithm/function.
f = @(x) sin(x) - 3*cos(x.^2) + 2*sin(x).^2;
g = @(x) asin(3*cos(x.^2) - 2*sin(x).^2);
df =@(x) 6.*x.*sin(x.^2) + 2*sin(2.*x) + cos(x); %This answer was found via wolfram and hart alpha.
ezplot(f)
% Zooming in while using ezplot simply shows the roots
incrementalRoots = roots_Incremental(f, -5, 5, 100)
%The incremental method shows similar answers to the actual positive roots below, with
%an error due to bin size.
secantRoots = roots_ModifiedSecant(f,3,1e-6,0.1)
secantRoots = roots_ModifiedSecant(f,-3,1e-6,0.1)
%The Modified Secant method returns a proper result, depending on the
%guess.
bisectionRoots = roots_Bisection(f,0,4,.1)
bisectionRoots = roots_Bisection(f,-4,0,.1)
%The bisection method works depending on the initial brackets
fixedRoots = roots_FixedPoint(f,g,3,.05)
fixedRoots = roots_FixedPoint(f,g,-4,.05)
%The fixed root method does not give a proper answer due to its nature.
falseRoots = roots_FalsePosition(f,-3.8,-2.8,0.05)
falseRoots = roots_FalsePosition(f,0,4.8,0.05)
%The false position method obtains the proper roots, depending on the
%bracket used.
newtonRoots = roots_NewtonRaphson(f,df,3,0.05)
newtonRoots = roots_NewtonRaphson(f,df,-3,0.05)
%The Newton Raphson method gets the proper roots, depending on the initial
%guess.
hybridRoots = roots_hybridFalse(f, -5, 5, 500, 0.1)
%The hybrid algorithm uses a combination of the incremental and the false
%position to obtain exact roots at a rapid pace.

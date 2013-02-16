close all
clear all
clc
format long
%% ***********************************************************************
% Homework 5 File
% Purpose: This file compiles all of the homework answers to be published
% in a tidy html format.
%
% 
% Adam Hollock
% 12 February 2012
amps_1 = xlsread('Homework%205%20Data.xlsx', 1, 'A2:A42');
volts_1 = xlsread('Homework%205%20Data.xlsx', 1, 'B2:B42');

days_2 = xlsread('Homework%205%20Data.xlsx', 2, 'A3:A23');
counts_2 = xlsread('Homework%205%20Data.xlsx', 2, 'B3:B23');

temp_3 = xlsread('Homework%205%20Data.xlsx', 3, 'A3:A32');
power_3 = xlsread('Homework%205%20Data.xlsx', 3, 'B3:B32');

sec_4 = xlsread('Homework%205%20Data.xlsx', 4, 'A3:A22');
bacteria_4 = xlsread('Homework%205%20Data.xlsx', 4, 'B3:B22');

sec_5 = xlsread('Homework%205%20Data.xlsx', 5, 'A3:A53');
acc_5 = xlsread('Homework%205%20Data.xlsx', 5, 'B3:B53');

days_6 = xlsread('Homework%205%20Data.xlsx', 6, 'A3:A5003');
m_6 = xlsread('Homework%205%20Data.xlsx', 6, 'B3:B5003');
%% This will read in all of the data from the excel file

%% Problem 1
% A technician is trying to find the resistance of an electrical component,
% and records the voltage drop across the component for each input current.
% Determine the resistance of the component using the cf_linfit function.

[coeff_1, r_2_1] = cf_linfit(amps_1, volts_1,  'linear')
%% ***********************************************************************

%% Problem 2
% An engineer obtains a piece of material that is radioactive. To try to
% determine the material, a Geiger counter is used to measure the count
% rate (decays per unit time). The number of decays per day is recorded
% versus time. The standard decay equation is
% A(t) = A0*exp(-lambda*tt)
% Where A0 is the initial decay rate, and lambda is the decay constant,
% defined as
% lambda = ln(2)/T_1_2
% Where T_1_2 is the half life. Determine the half life of the material.
[coeff_2, r_2_2] = cf_linfit(days_2, counts_2,  'exponential');
lambda = coeff_2(2);
T_1_2 = lambda*log(2)

%% ***********************************************************************

%% Problem 3
% An engineer is tryint to determine the emissivity of a material by
% heating the material to various temperatures and measuring the power per
% unit area irradiated. Calculate the emissivity of the material.
% After searching, it was determined that power model would be used.
[coeff_3, r_2_3] = cf_linfit(temp_3, power_3,  'power');

%% ***********************************************************************

%% Problem 4
% A microbiologist is trying to measure the growth rate parameters of a
% strain of bacteria. The measured data is recorded. Using the saturation
% growth model, determine the two unknown coefficients.
[coeff_4, r_2_4] = cf_linfit(sec_4, bacteria_4,  'saturation');

coeff_4

%% ***********************************************************************

%% Problem 5
% An accelerometer is attached to a land rocket on the flat plains for
% testing. The data is recorded. Using the cf_polyfit function, and
% assuming the initial position is at x=0, determine the velocity and
% position of the land rocket over the time period.
[coeff_5, r_2_5] = cf_polyfit(sec_5, acc_5,  3);

%% ***********************************************************************

%% Problem 6
% A cheetah is tagged with a radio emitter, which gives its position over
% time. The data is recorded. The data looks like a quadratic fit will be
% the best fit. Estimate the following:
%a. The polynomial coefficients using all of the data at once (use the
%   cf_polyfit function.)
%b. The time-derived polynomial coefficients using the cf_rlse function.
% Plot the time-derived polynomial coefficients. What can these time
% dependent derived coefficients be used for in this case?

%Part a
[coeff_6_a, r_2_6_a] = cf_polyfit(days_6, m_6, 3);

%Part b
[coeff_6_b, r_2_6_b] = cf_poly_rlse(days_6, m_6, rand(1,100), rand(1,100), 3);

%% ***********************************************************************
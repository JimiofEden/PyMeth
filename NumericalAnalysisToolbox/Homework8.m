close all
clear all
clc
format long
%% ***********************************************************************
% Homework 8 File
% Purpose: This file compiles all of the homework answers to be published
% in a tidy html format.
%
% 
% Adam Hollock
% 8 March 2012
%% Problem 1
% Derive the solutions (Hint: use the Laplace transform to make your life
% easy
% http://www.vibrationdata.com/math/Laplace_Transforms.pdf
% ^ This is the transform table that was used.
% dNA(t)/dt = -lamA*NA(t)
% s*NA(s) - NA(0) = -lamA*NA(s)
% NA(s)*(s + lamA) = NA(0)
% NA(s) = NA(0)/(s+lamA)
% NA(t) = NA(0)*exp(-lamA*t)
%
% dNB(t) = -lamB*NB(t) + lamA*NA(t)
% s*NB(s) = -lamB*NB(s) + lamA*NA(s)
% NB(s)*(s+lamB) = lamA*NA(s)
% NB(s) = (lamA*NA(0)/(s+lamA))/(s+lamB)
% NB(t) = ((lamA*NA(0))/(lamB-lamA))*(exp(-lamA*t) - lam(-lamB*t))
%
% dNC(t)/dt = lamB*NB(t)
% s*NC(s) = lamB*NB(s)
% s*NC(s) = lamB*((lamA*NA(0)/(s+lamA))/(s+lamB))
% NC(s) = lamB*((lamA*NA(0)/(s*(s+lamA))*(s+lamB)))
% NC(s) = (lamB*lamA*Na(0))/(1/(lamA*lamB) + exp(-lamA*t)/(lamA*(lamA-lamB)) + exp(-lamB*t)/(lamB*(lamA-lamB))
% NC(s) = (NA(0)/(lamB - lamA))*(lamB(1-exp(-lamA*t)) - lamA(1-exp(-lamB*t)))
%% ***********************************************************************

%% Problem 2
% Solve both analytically and numerically for the cases below. Numerically,
% solve the equations using the following 3 methods: Euler, Runge-Kutta
% (4th order), and ODE45 (MATLAB function.) Compare and contrast the
% numerical solutions of each to the numerical.
%% Case 1
NA_1 = 1000;
lamA_1 = 1;
lamB_1 = 0.2;
dt_1 = 2;
t_1 = 30;
f_1a = @(x) NA_1*exp(-lamA_1*x);
df_1a = @(x) -lamA_1*f_1a(x);

%% Equation 1 Euler
[tout_1a1, y_1a1] = ode_euler(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(1)
plot(tout_1a1,y_1a1, '--r')
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 1 Runge Kutta
[tout_1b1, y_1b1] = ode_rungekutta(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(2)
plot(tout_1b1,y_1b1, '--r')
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 1 ODE45
[tout_1c1, y_1c1] = ode45_use(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(3)
plot(tout_1c1,y_1c1, '--r') 
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

f_1b = @(x) ((lamA_1*NA_1)/(lamB_1-lamA_1))*(exp(-lamA_1*x) - exp(-lamB_1*x));
df_1b = @(x) -lamB_1*f_1b(x) + lamA_1*f_1a(x);
%% Equation 2 Euler
[tout_1a2, y_1a2] = ode_euler(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(4)
plot(tout_1a2,y_1a2, '--r')
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 2 Runge Kutta
[tout_1b2, y_1b2] = ode_rungekutta(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(5)
plot(tout_1b2,y_1b2, '--r')
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 2 ODE45
[tout_1c2, y_1c2] = ode45_use(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(6)
plot(tout_1c2,y_1c2, '--r') 
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

f_1c = @(x) (NA_1)/(lamB_1-lamA_1)*(lamB_1*(1-exp(-lamA_1*x)) - lamA_1*(1-exp(-lamB_1*x)));
df_1c = @(x) lamB_1*f_1b(x);
%% Equation 3 Euler
[tout_1a3, y_1a3] = ode_euler(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(7)
plot(tout_1a3,y_1a3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);


%% Equation 3 Runge Kutta
[tout_1b3, y_1b3] = ode_rungekutta(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(8)
plot(tout_1b3,y_1b3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 3 ODE45
[tout_1c3, y_1c3] = ode45_use(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(9)
plot(tout_1c3,y_1c3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************



%% Case 2
NA_1 = 1000;
lamA_1 = 1;
lamB_1 = 0.2;
dt_1 = 0.2;
t_1 = 30;
f_1a= @(x) NA_1*exp(-lamA_1*x);
df_1a = @(x) -lamA_1*f_1a(x);

%% Equation 1 Euler
[tout_2a1, y_2a1] = ode_euler(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(10)
plot(tout_2a1,y_2a1, '--r')
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 1 Runge Kutta
[tout_2b1, y_2b1] = ode_rungekutta(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(11)
plot(tout_2b1,y_2b1, '--r')
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 1 ODE45
[tout_2c1, y_2c1] = ode45_use(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(12)
plot(tout_2c1,y_2c1, '--r') 
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

f_1b = @(x) ((lamA_1*NA_1)/(lamB_1-lamA_1))*(exp(-lamA_1*x) - exp(-lamB_1*x));
df_1b = @(x) -lamB_1*f_1b(x) + lamA_1*f_1a(x);
%% Equation 2 Euler
[tout_2a2, y_2a2] = ode_euler(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(13)
plot(tout_2a2,y_2a2, '--r')
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 2 Runge Kutta
[tout_2b2, y_2b2] = ode_rungekutta(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(14)
plot(tout_2b2,y_2b2, '--r')
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 2 ODE45
[tout_2c2, y_2c2] = ode45_use(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(15)
plot(tout_2c2,y_2c2, '--r') 
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

f_1c = @(x) (NA_1)/(lamB_1-lamA_1)*(lamB_1*(1-exp(-lamA_1*x)) - lamA_1*(1-exp(-lamB_1*x)));
df_1c = @(x) lamB_1*f_1b(x);
%% Equation 3 Euler
[tout_2a3, y_2a3] = ode_euler(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(16)
plot(tout_2a3,y_2a3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);


%% Equation 3 Runge Kutta
[tout_2b3, y_2b3] = ode_rungekutta(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(17)
plot(tout_2b3,y_2b3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 3 ODE45
[tout_2c3, y_2c3] = ode45_use(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(18)
plot(tout_2c3,y_2c3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

    
%% Case 3
NA_1 = 1000;
lamA_1 = 0.2;
lamB_1 = 1;
dt_1 = 2;
t_1 = 30;
f_1a= @(x) NA_1*exp(-lamA_1*x);
df_1a = @(x) -lamA_1*f_1a(x);
%% Equation 1 Euler
[tout_3a1, y_3a1] = ode_euler(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(19)
plot(tout_3a1,y_3a1, '--r')
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 1 Runge Kutta
[tout_3b1, y_3b1] = ode_rungekutta(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(20)
plot(tout_3b1,y_3b1, '--r')
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 1 ODE45
[tout_3c1, y_3c1] = ode45_use(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(21)
plot(tout_3c1,y_3c1, '--r') 
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

f_1b = @(x) ((lamA_1*NA_1)/(lamB_1-lamA_1))*(exp(-lamA_1*x) - exp(-lamB_1*x));
df_1b = @(x) -lamB_1*f_1b(x) + lamA_1*f_1a(x);
%% Equation 2 Euler
[tout_3a2, y_3a2] = ode_euler(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(22)
plot(tout_3a2,y_3a2, '--r')
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 2 Runge Kutta
[tout_3b2, y_3b2] = ode_rungekutta(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(23)
plot(tout_3b2,y_3b2, '--r')
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 2 ODE45
[tout_3c2, y_3c2] = ode45_use(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(24)
plot(tout_3c2,y_3c2, '--r') 
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

f_1c = @(x) (NA_1)/(lamB_1-lamA_1)*(lamB_1*(1-exp(-lamA_1*x)) - lamA_1*(1-exp(-lamB_1*x)));
df_1c = @(x) lamB_1*f_1b(x);
%% Equation 3 Euler
[tout_3a3, y_3a3] = ode_euler(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(25)
plot(tout_3a3,y_3a3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);


%% Equation 3 Runge Kutta
[tout_3b3, y_3b3] = ode_rungekutta(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(26)
plot(tout_3b3,y_3b3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 3 ODE45
[tout_3c3, y_3c3] = ode45_use(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(27)
plot(tout_3c3,y_3c3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

%% Case 4
NA_1 = 1000;
lamA_1 = 0.2;
lamB_1 = 1;
dt_1 = 0.2;
t_1 = 30;
f_1a = @(x) NA_1*exp(-lamA_1*x);
df_1a = @(x) -lamA_1*f_1a(x);

%% Equation 1 Euler
[tout_4a1, y_4a1] = ode_euler(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(28)
plot(tout_4a1,y_4a1, '--r')
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 1 Runge Kutta
[tout_4b1, y_4b1] = ode_rungekutta(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(29)
plot(tout_4b1,y_4b1, '--r')
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 1 ODE45
[tout_4c1, y_4c1] = ode45_use(f_1a, df_1a, f_1a(0), dt_1, t_1);
figure(30)
plot(tout_4c1,y_4c1, '--r') 
hold on
ezplot(f_1a, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

f_1b = @(x) ((lamA_1*NA_1)/(lamB_1-lamA_1))*(exp(-lamA_1*x) - exp(-lamB_1*x));
df_1b = @(x) -lamB_1*f_1b(x) + lamA_1*f_1a(x);
%% Equation 2 Euler
[tout_4a2, y_4a2] = ode_euler(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(31)
plot(tout_4a2,y_4a2, '--r')
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 2 Runge Kutta
[tout_4b2, y_4b2] = ode_rungekutta(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(32)
plot(tout_4b2,y_4b2, '--r')
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 2 ODE45
[tout_4c2, y_4c2] = ode45_use(f_1b, df_1b, f_1b(0), dt_1, t_1);
figure(33)
plot(tout_4c2,y_4c2, '--r') 
hold on
ezplot(f_1b, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

f_1c = @(x) (NA_1)/(lamB_1-lamA_1)*(lamB_1*(1-exp(-lamA_1*x)) - lamA_1*(1-exp(-lamB_1*x)));
df_1c = @(x) lamB_1*f_1b(x);
%% Equation 3 Euler
[tout_4a3, y_4a3] = ode_euler(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(34)
plot(tout_4a3,y_4a3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);


%% Equation 3 Runge Kutta
[tout_4b3, y_4b3] = ode_rungekutta(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(35)
plot(tout_4b3,y_4b3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);

%% Equation 3 ODE45
[tout_4c3, y_4c3] = ode45_use(f_1c, df_1c, f_1c(0), dt_1, t_1);
figure(36)
plot(tout_4c3,y_4c3, '--r')
hold on
ezplot(f_1c, [0 t_1])
axis([0, t_1, 0, 1000]);

%% ***********************************************************************

%% Problem 3
% Additionally for each of the cases, plot NA+NB+NC over time. Do you
% notice anything?

%Case 1
figure(37)
plot(tout_1c3, y_1a3+y_1b3+y_1c3')

%Case 2
figure(38)
plot(tout_2c3, y_2a3+y_2b3+y_2c3')

%Case 3
figure(39)
plot(tout_3c3, y_3a3+y_3b3+y_3c3')

%Case 4
figure(40)
plot(tout_4c3, y_4a3+y_4b3+y_4c3')

%% ***********************************************************************
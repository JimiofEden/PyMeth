function [tout, y] = ode_rungekutta(f, fdt, y0, dt, tin)
%% ***********************************************************************
% FUNCTION ode_rungekutta
% Purpose: This finds a direct estimate of the next point in a function
% based off of the derivative at time given
%
% Function call: [tout, y] = ode_rungekutta(f, fdt, y0, dt, tin)
%
% Input: f = Function of the system
% y0 = initial position
% dt = derivative to use for model
% samples = how many data points to use total
% t = ending time to use for model
%
% Outputs: tout = time scale used
% y = solution found via Euler's method
%
% Adam Hollock
% 13 March 2012
%% ***********************************************************************
y = y0*ones(1,tin/dt);
for i = 1:length(y)
    k1 = fdt(i*dt);
    k2 = fdt(i*dt+dt/2);
    k3 = fdt(i*dt+dt/2);
    k4 = fdt(i*dt+dt);
    y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+2*k4)*dt;
end
tout = 0:dt:tin;
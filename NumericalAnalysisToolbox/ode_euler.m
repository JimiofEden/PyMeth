function [tout, y] = ode_Euler(f, fdt, y0, dt, tin)
%% ***********************************************************************
% FUNCTION odeEulter
% Purpose: This finds a direct estimate of the next point in a function
% based off of the derivative at time given
%
% Function call: [t, y] = ode_Euler(y0, dt, t)
%
% Input: y0 = initial position
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
    y(i+1) = y(i) + dt*fdt(i*dt);
end
tout = 0:dt:tin;
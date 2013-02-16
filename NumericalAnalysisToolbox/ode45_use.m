function [t,y] = ode45_use(f,fdt,y0,dt,tin)
%% ***********************************************************************
% FUNCTION ode45_use
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
[t,y] = ode45(@calcdydt,[0:dt:tin],y0);
    function dydt = calcdydt(t,y)
        dydt = fdt(t);
    end
end
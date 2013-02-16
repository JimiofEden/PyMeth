function [coeffNum, coeffDen, inter] = interp_pade(f, df, about, startpt, endpt, M, N)
%% ***********************************************************************
% FUNCTION interp_lagrange
% Purpose: produces the numerator and denominator coefficients, as well as
% the interpolated data, using the Pade approximation
%
% Function call: [coeff, inter] = interp_pade(f, df, about, startpt, endpt, M, N)
%
% Input: f = input function handle
% df = derivative of the input function handle
% about = point to be solved about for the taylor expression
% startpt = the beginning point of analysis
% endpt = The ending point of analysis
% M = The order of the numerator
% N = The order of the denominator
%
% Outputs: coeffNum - Coefficients of the numerator of the polynomial
% coeffDen - Coefficients of the denominator of the polynomial
% inter - interpolated data 
%
% Adam Hollock
% 20 February 2012
%% ***********************************************************************

%Sets a time signal
tt = startpt:(1/1000):endpt;

%Will find taylor coefficients
Tay = zeros(M+N,1);
Tay(1) = f(about);
for i = 2:(M+N)+1
    Tay(i) = df(about)/factorial(i-1);
end

%Solves for the denominator coefficients
Aden = zeros(N);
for i = M+N:-1:N+M-1
    Aden(i-M,:) = Tay(i:-1:i-N+1)';
    Bden(i-M,1) = -Tay(i+1);
end

Dden = Aden\Bden;

%Solves for the numerator coefficients
Anum = zeros(M+1,M);
for i = 1:M
    Anum(:,i) = cat(1,zeros(i-1,1),Tay(1:M+N-i));
end

%Solves for the Q coefficients
Q = (Anum*[1;Dden])';
D = [1 Dden'];

Num_use = polyval(reverse(Q), tt);
Dem_use = polyval(reverse(D), tt);
y_use = Num_use./Dem_use;
y_use_taylor = polyval(reverse(Tay),tt);

coeffNum = reverse(Q);
coeffDen = reverse(D);
inter = y_use;

ezplot(f, [startpt, endpt])
hold on
plot(tt,y_use, 'r')
hold on
plot(tt,y_use_taylor, 'g')
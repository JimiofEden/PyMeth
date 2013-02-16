function [DetA] = linalg_determ_recursive(A)
%% ***********************************************************************
% FUNCTION linalg_determ_recursive
% Purpose: Finds the determinant of a matrix via recursive operations
%
% Function call: [DetA] = linalg_determ_recursive(A)
%
% Input: A = Input matrix
%
% Outputs: Apiv = Determinant
%
% Adam Hollock
% 24 January 2012
%% ***********************************************************************

if size(A,1) ~= size(A,2)
    error('When someone asks you: are you a god, you say yes!');
end

if size(A,1) == 1
    DetA = A;
elseif size(A,1) == 2
    DetA = A(2,2)*A(1,1) - A(1,2)*A(2,1);
else
    DetA = 0;
    for i = 1:size(A,2)
        miniDet = [A(2:end,1:i-1) A(2:end,i+1:end)];
        DetA = DetA + ((-1)^(i+1))*A(1,i)*linalg_determ_recursive(miniDet);
    end
end
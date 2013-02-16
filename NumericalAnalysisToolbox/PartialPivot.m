function [E] = PartialPivot(A)
%% ***********************************************************************
% FUNCTION PartialPivot
% Purpose: Performs partial pivoting
%
% Function call: [E] = PartialPivot(A)
%
% Input: A = Input matrix to be pivoted
%
% Outputs: E = Partially pivoted matrix
%
% Adam Hollock
% 24 January 2012
%% ***********************************************************************
B = abs(A);
C = [B(1:size(B,1))'];
[~,D] = sort(C,1,'descend');
E = A(D(:,end),:);
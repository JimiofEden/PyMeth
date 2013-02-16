function [answerRoots] = roots_Incremental(f,startPt,endPt,sampleSize)
%% ***********************************************************************
% FUNCTION ROOTS_INCREMENTAL
% Purpose: Calculates the roots of a given function in between two points,
% as determined via the Incremental Search method
%
% Function call: [answerRoots] = roots_Incremental(f,startPt,endPt,binSize)
%
% Input: f = polynomial function
% startPt = Starting point of the search
% endPt = Ending point of the search
% binSize = The sampling size (how many points are searched in between the
% starting and ending point.)
%
% Outputs: answerRoots = array of roots for the given function.
%
% Adam Hollock
% 15 January 2012
%% ***********************************************************************

sampleSize = (endPt-startPt)/sampleSize; %Sets the sampling size
roots = [];                              %Initializes root vector
counter = 0;

for i=startPt:sampleSize:endPt
    l = i-sampleSize;                    %Sets up a second variable one step behind i
    if f(i)*f(l) < 0                     %If the product of f(i) and f(l) is < 0, then
        roots = [roots, i];              %   there is a root estimated at i.
    end
    counter = counter + 1;
end
answerRoots = roots;                     %Output
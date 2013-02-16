from numpy import *

def bisection(f,startPt,endPt,epsilon): 
    '''
    %% ***********************************************************************
    % FUNCTION ROOTS_BISECTIONS
    % Purpose: Calculates the roots of a given function in between two points,
    % as determined via the Bisection method.
    %
    % Function call: [answerRoots] = roots_Bisection(f,startPt,endPt,epsilon)
    %
    % Input: f = polynomial function
    % startPt = starting point of the search
    % endPt = Ending point of the search
    % epsilon = Stopping criterion
    %
    % Outputs: answerRoots = array of roots for the given function.
    %
    % Adam Hollock
    % 15 January 2012
    %% ***********************************************************************
    '''
    #Sets up a large difference so the loop will run through at least once.
    diff = 100000000
    #Initializes xl and xu as the starting and ending points.          
    xl = startPt
    xu = endPt
    xr = (xl + xu)/2
    counter = 0

    while diff > epsilon and (f(xl)*f(xu)) < 0:
        #This will move either the lower or the higher end point to the mid.
        if f(xl)*f(xr) > 0:
            xl = xr;
        elif f(xu)*f(xr) > 0:
            xu = xr
        
        #Finds the middle point.
        xrnew = (xl + xu)/2
        #Updates the difference for the next loop.
        diff = abs((abs(xr)-abs(xrnew))/abs(xr))*100
        #Updates the x value
        xr = xrnew                
        counter = counter + 1
        #This will catch the program if a convergence takes too long.
        if counter >= 50:
            error('I think there might be a problem capn.')

    IternationNumBisection = counter
    answerRoots = xr
    return answerRoots
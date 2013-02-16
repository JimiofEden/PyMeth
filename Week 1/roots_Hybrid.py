from numpy import *

def hybrid(f,startPt,endPt,sample,epsilon):
    '''
    %% ***********************************************************************
    % FUNCTION ROOTS_Hybrid
    % Purpose: Calculates the roots of a given function in between two points,
    % as determined via the Bisection method.
    %
    % Function call: [answerRoots] = roots_Bisection(f,startPt,endPt,epsilon)
    %
    % Input: f = polynomial function
    % startPt = starting point of the search
    % endPt = Ending point of the search
    % sample = Sampling size of the search
    % epsilon = Stopping criterion
    %
    % Outputs: answerRoots = array of roots for the given function.
    %
    % Adam Hollock
    % 15 January 2012
    %% ***********************************************************************
    '''

    sampleSize = (endPt-startPt)/sample
    #initializes root vector
    roots = mat([])
    IterationHybrid = 0

    for i in arange(startPt,endPt,sampleSize):
        if (f(i)*f(i+sampleSize) < 0):
            counter = 0
            #Sets up a large difference so the loop will run through at least once.
            diff = 100000000
            #Initializes xl and xu as the starting and ending points.
            xl = i
            xu = i+sampleSize
            '''
            It can be assume that if the sample is crossing zero at this point:
            The sample has enough of
            a slope to allow the
            false position method to
            work
            '''
            xr = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu))  
            while diff > epsilon:
                #This will move either the lower or hte higher end point to the mid,
                if f(xl)*f(xr) > 0:
                    xl = xr
                elif f(xu)*f(xr) > 0:
                    xu = xr
        
                xrnew = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu))
                #Updates the difference for the next loop.
                diff = abs((abs(xr)-abs(xrnew))/abs(xr))*100
                #Updates the x value
                xr = xrnew
                counter = counter + 1
                #This will catch the program if a convergence takes too long.
                if counter >= 200:
                    error('I think there might be a problem capn.')
        
            IterationHybrid = IterationHybrid + counter;
            roots = concatenate((roots,mat([xr])),1)
    return roots
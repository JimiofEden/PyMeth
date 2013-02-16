def falsePosition(f,startPt,endPt,epsilon):
    '''
    %% ***********************************************************************
    % FUNCTION ROOTS_FALSEPOSITION
    % Purpose: Calculates the roots of a given function in between two points,
    % as determined via the False Position method.
    %
    % Function call: [answerRoots] = roots_FalsePosition(f,startPt,endPt,epsilon)
    %
    % Input: f = polynomial function
    % startPt = The starting point for the function bracket
    % endPt = The ending point for the function bracket
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
    xl = startPt
    xu = endPt
    xr = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu))
    counter = 0

    while diff > epsilon:
        #This will move either the lower or the higher end point to the mid.
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
        
    IternationNumFalsePosition = counter
    return xr
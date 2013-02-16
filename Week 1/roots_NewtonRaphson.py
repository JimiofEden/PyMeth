import numpy

def newtonRaphson(f,df,guess,epsilon):
	'''
	%% ***********************************************************************
	% FUNCTION ROOTS_FALSEPOSITION
	% Purpose: Calculates the roots of a given function in between two points,
	% as determined via the NewtonRaphson method.
	%
	% Function call: [answerRoots] = roots_NewtonRaphson(f,df,guess,epsilon)
	%
	% Input: f = polynomial function
	% df = The derivative of f
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
	counter = 0
	if guess==0:
		x = 0.01
	else:
		x = guess

	while diff > epsilon:

		#Newton Raphson Equation
		xnew = x - f(x)/df(x)
		print x
		#Updates the difference for the next loop.
		diff = abs((abs(x)-abs(xnew))/abs(x))*100
		#Updates the x value
		x = xnew
		counter = counter + 1
		#This will catch the program if a convergence takes too long.
		if counter >= 50:
			error('I think there might be a problem capn.')

	IternationNumNewtonRaphson = counter
	answerRoots = x;
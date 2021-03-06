#Requires numpy and matlibplot
import string
import math

import numpy
from pylab import *

def polyfit(x, y, order, b = None):
	'''
	%% ***********************************************************************
	% FUNCTION cf_polyfit
	% Purpose: a polynomial fitting function that will, given a set of data,
	% provide the coefficients, as well as plotting the fit with the data.
	%
	% Function call: [coeff, r_2] = cf_polyfit(x, y, order, stdev)
	%
	% Input: x = 1xN Input vector of data
	% y = 1xN Input vector of indices 
	% order = the order of the polynomial used to fit
	% stdev = an optional input: set of standard deviations for the weighted
	% least squares method
	%
	% Outputs: coeff - Coefficients of the data
	% r_2 - coefficient of determination
	%
	% Adam Hollock
	% 12 February 2012
	%% ***********************************************************************
	'''

	#Ensures that the data and index vector are the same lengths
	#if size(x,1) ~= size(y,1):
	#	error('It''s a trap!')

	#length of the input data
	n = x.shape[0]

	#Calculates the average of y
	y_mean = sum(y)/n;

	#Sets up a dummy variable for coefficients
	Z = ones((x.shape[0],order+1))

	#This sets up the multiplication matrix with the different exponents
	for i in arange(0,order):
		Z[:,i] = (x**(order-i))

	Z = numpy.asmatrix(Z)
	#Checks to see if an array of standard deviations are entered. If not, will
	#use the general linear least squares algorithm
	if (b == None):
		#Coefficients
		A = linalg.solve((Z.conj().transpose()*Z),(Z.conj().transpose()*mat([y]).conj().transpose()))
	#Will otherwise use the weighted least squares algorithm
	else:
		W = diag(1/(stdev**2))
		A = linalg.solve((Z.conj().transpose()*W*Z),(Z.conj().transpose()*W*y))

	# sum of the squares
	St = sum((y-y_mean)**2)

	#Sum of the squares of the stimate residuals
	Sr = sum((y-Z*A)**2)

	#Find the coefficient of determination
	r_2 = (St-Sr)/St

	tt = arange(min(x),max(x),0.01, dtype=float)

	#This will plot the polynomial
	y_use = polyval(A,tt);
	plot(tt,y_use)
	hold(True)
	plot(x,y,'g')
	show()
	coeff = A.conj().transpose()
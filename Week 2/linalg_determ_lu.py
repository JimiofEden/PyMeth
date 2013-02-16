from numpy import *
import linalg_lu

def determ_lu(A):
	'''
	%% ***********************************************************************
	% FUNCTION linalg_determ_lu
	% Purpose: Finds the determinant of a matrix via LU factorization
	%
	% Function call: [DetA] = linalg_determ_lu(A)
	%
	% Input: A = Input matrix
	%
	% Outputs: Apiv = Determinant
	%
	% Adam Hollock
	% 24 January 2012
	%% ***********************************************************************
	'''

	if size(A,1) ~= size(A,2):
	    error('When someone asks you: are you a god, you say yes!');

	L, U, P = linalg_lu.lu(A)

	DetA = prod(diag(L))*prod(diag(U))
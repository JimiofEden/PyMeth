from numpy import argsort
def pp(A):
	'''
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
	'''
	B = abs(A)
	#print B

	C = (B[0:B.shape[0]])
	#print C

	D = argsort(C,0)[::-1]
	#print D

	E = A[D[:,-1],:]
	#print E

	return E
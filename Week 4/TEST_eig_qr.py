import eigen_qr
from numpy import *

'''
Adam Hollock 2/8/2013
Finds the eigenvalues and eigenvectors of a given matrix using the power method
'''

A = mat("3 2 1; 9 2 3; 6 4 2")

eigVal, eigVect = eigen_qr.eqr(A)
print eigVal
print eigVect
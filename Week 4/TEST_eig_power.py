import eig_power
from numpy import *

'''
Adam Hollock 2/8/2013
Finds the eigenvalues and eigenvectors of a given matrix using the power method
'''

A_2 = mat("3 1 7; 2 9 3; 6 1 4")

eigVal, eigVect = eig_power.epower(A_2)
print eigVal
print eigVect
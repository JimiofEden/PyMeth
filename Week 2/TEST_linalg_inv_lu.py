import linalg_inv_lu
import numpy

'''
Adam Hollock 2/9/2013
This will find the inverse of a matrix using LU methods
'''

A_1 = numpy.mat("6  3  9  9; 8 -8  9  0; -7 -4 -7  6; 8  1  9 -7")

Ainv_1_1 = linalg_inv_lu.lu(A_1)

print Ainv_1_1
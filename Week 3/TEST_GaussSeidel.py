import GaussSeidel
from numpy import *
'''
Adam Hollock 2/8/2013
This uses the Guass Seidel iterative solution to solve AX=B
'''


A_1 = mat("3. 0. -8.; 5. 3. 2.; 4. 4. -8.")
B_1 = mat("4.;-3.;10.")
guess_1 = mat("1.;1.;1.")
eps_1 = 0.01/100
lam_1 = 0.5
maxit_1 = 300
print GaussSeidel.gs(A_1,B_1,guess_1,eps_1,lam_1,maxit_1)



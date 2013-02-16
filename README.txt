Adam Hollock
January 18th 2013


This file is a compilation of the matlab .m files that were created for a 10 week graduate level numerical analysis course.
Since these files were homework based, there are a group of functions with a wrap-up homework file at the end of each group.
The files should be self-sufficient in how to set them up, but if any ambiguity exists, the homework files should clarify
and show examples for how each function is called. Using Matlab's publish feature on the homework files will create a tidy html
file. Keep in mind that these files are meant to be used as a toolbox, so it might be worth it to make a seperate folder to contain
them.
Contained are the following files:

roots_Bisection.m 	     	: Calculates the roots of a given function in between two points, as determined via the Bisection method.
roots_FalsePosition.m    	: Calculates the roots of a given function in between two points, as determined via the False Position method.
roots_FixedPoint.m       	: Calculates the roots of a given function in between two points, as determined via the Fixed-Point method.
roots_HybridFalse.m      	: Calculates the roots of a given function in between two points, as determined via a hybrid Bisection nonlinear method.
roots_Incremental.m      	: Calculates the roots of a given function in between two points, as determined via the Incremental Search method
roots_ModifiedSecant.m   	: Calculates the roots of a given function in between two points, as determined via the Modified Secant.
roots_NewtonRaphson.m    	: Calculates the roots of a given function in between two points, as determined via the newton raphson method.
Homework1.m             	: Example file of the above functions.

linalg_inv_rr.m          	: Calculate the inverse of a matrix using row reducing methods. If the matrix is not square, it will return the psuedoinverse.
linalg_lu.m                	: Break a matrix A into a lower diagonal, upper diagonal, and a permutation matrix.
linalg_inv_lu.m            	: Calculate the inverse of a matrix using LU facctorization. If the matrix is not square, it will return the psuedoinverse.
linagl_determ_recursive.m	: Calculate the determinant of a matrix using recursive operations.
linalg_determ_lu.m       	: Calculate the determinant of a matrix using LU factorization
linalg_pivot.m           	: Calculate the solution (N equations, N unknowns) of a system of equations using Gaussian elimination using partial pivoting.
PartialPivot.m				: Performs partial pivoting.
Homework2.m					: Example file of the above functions.

Jacobi.m					: Performs the Jacobi iterative method of solution given an input system of equations and solutions ([A][X] = [B})
GaussSeidel.m				: Performs the Gauss Seidel iterative method of solution given an input system of equations and solutions ([A][X] = [B})
Homework3.m					: Example file of the above functions

eig_power.m					: Calculates the eigenvalues and eigenvectors of a matrix using the power method.
eigen_qr.m					: Finds the eigenvalues using the QR method, then finds the eigenvectors using the power method.
Homework4.m					: Example file of the above functions

cf_linfit.m					: A linear fitting function that will, given a set of data, provide the coefficients, for linear, exponential, power, and 
							  saturation growth rate models, as well as the coefficient of determination and plots the data.
cf_polyfit.m				: Purpose: a polynomial fitting function that will, given a set of data, provide the coefficients, as well as plotting the fit with the data.
cf_poly_rise.m				: A polynomial fitting function that will, given a set of data, provide the coefficients, as well as plotting the fit with the data.
Homework5.m					: Example file of the above functions

interp_lagrange.m			: Produces the polynomial (and the interpolated data) that fits an x,y data set in which the polynomial passes exactly through the data points
interp_cheby.m				: Produces the polynomial (and interpolated data) that passes through all points in the x,y data set using the Cebyshev polynomial approximation
interp_pade.m				: Produces the numerator and denominator coefficients, as well as the interpolated data using the Pade approximations
interp_cubic.m				: Produces the interpolated data for an x,y data set using the cubic spline technique (This is a bit of a crowning achievement for me.)
Homework6.m					: Example file of the above functions

int_newton.m				: Calculates the integral via the Newton-Cotes method
int_trap.m					: Calculates the integral via the composite trapezoidal rule
int_simp.m					: Calculates the integral via Simpson's rule. Adjust the calculation of the integral based on whether the number of segments is odd or even
int_richardson.m			: Calculates the integral using an iterative Richardson method, where the iterations stop after meeting a designated relative error criterion or maximum iterations
int_gauss_legendre.m		: Calculate the integral using Gauss-Legendre integration
int_gauss_hermite.m			: Calculate the integral using Gauss-Laguerre integration
int_gauss_cheby1.m			: Calculate the integral using Gauss-Chebyshev (form 1) integration
int_gauss_cheby2.m			: Calculate the integral using Gauss-Chebyshev (form 2) integration
Homework7.m					: Example file of the above functions

ode_euler.m					: This finds a direct estimate of the next point in a function based off of the derivative at time given. It is used for
								solving ordinary differential equations using Euler's method.
ode_rungekutta.m			: This finds a direct estimate of the next point in a function based off of the derivative at time given. It is used for
								solving ordinary differential equations using the Runge-Kutta method.
ode45_use					: This finds a direct estimate of the next point in a function based off of the derivative at time given. It is used for
								solving ordinary differential equations using MATLAB's ODE45.
Homework8.m					: Example file of the above functions
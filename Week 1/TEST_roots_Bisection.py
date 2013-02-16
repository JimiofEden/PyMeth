import roots_Bisection
import numpy
'''
Adam Hollock 2/8/2013
This will calculate the roots of a given function in between two given
points via the Bisection method.
'''

def f(x): return x**3+2*x**2-5*x-6
results = roots_Bisection.bisection(f,-3.8,-2.8,.05)
print results
results = roots_Bisection.bisection(f,-1.3,-0.9,.05)
print results
results = roots_Bisection.bisection(f,1.8,2.3,.05)
print results

#For comparison
print numpy.roots([1,2,-5,-6])
import roots_Incremental
import numpy
'''
Adam Hollock 2/8/2013
This will calculate the roots of a given function in between two given
points via the Incremental method.
'''

def f(x): return x**3+2*x**2 - 5*x - 6
results = roots_Incremental.incremental(f, -4, 4, 50.0)
print results

results = roots_Incremental.incremental(f, -4, 4, 300.0)
print results

results = roots_Incremental.incremental(f, -4, 4, 301.0)
print results

#For comparison
print numpy.roots([1,2,-5,-6])
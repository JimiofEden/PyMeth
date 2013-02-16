import roots_ModifiedSecant
import numpy
'''
Adam Hollock 2/8/2013
This will calculate the roots of a given function in between two given
points via the Incremental method.
'''

def f(x): return x**3-(3541*x**2)/2500- (48741701*x)/5000000 + 41249804989/2500000000;

results = roots_ModifiedSecant.modifiedSecant(f,-2.5,1.0e-6,5.0e-6)
print results

results = roots_ModifiedSecant.modifiedSecant(f,1.5,1.0e-6,5.0e-6)
print results

results = roots_ModifiedSecant.modifiedSecant(f,4.0,1.0e-6,5.0e-5)
print results

print numpy.roots([1.0, -3541.0/2500.0, -48741701.0/5000000.0, 41249804989.0/2500000000.0])
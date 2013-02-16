import roots_NewtonRaphson
import numpy
'''
Adam Hollock 2/8/2013
This will calculate the roots of a given function in between two given
points via the Incremental method.
'''

def f(x): return 3-2*numpy.exp(x);
def df(x): return -2*numpy.exp(x);
results = roots_NewtonRaphson.newtonRaphson(f,df,0.4,0.05)
print results
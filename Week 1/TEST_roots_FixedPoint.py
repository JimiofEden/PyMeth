import roots_FixedPoint
import numpy
'''
Adam Hollock 2/8/2013
This will calculate the roots of a given function in between two given
points via the Fixed Point method.
'''

def f(x): return numpy.exp(-x)-x;
def g(x): return numpy.exp(-x);
results = roots_FixedPoint.fixedPoint(f,g,0,.05)
print results


#For comparison
print abs(numpy.log(results))
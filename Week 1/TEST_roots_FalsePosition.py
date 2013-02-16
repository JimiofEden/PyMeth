import roots_FalsePosition
import numpy

'''
Adam Hollock 2/8/2013
This will calculate the roots of a given function in between two given
points via the False Position method.
'''

def f(x): return x**3+2*x**2-5*x-6

results = roots_FalsePosition.falsePosition(f,-3.8,-2.8,0.05)
print results
results = roots_FalsePosition.falsePosition(f,-1.3,-0.9,0.05)
print results
results = roots_FalsePosition.falsePosition(f,1.8,2.3,0.05)
print results
print numpy.roots([1, 2, -5, -6])
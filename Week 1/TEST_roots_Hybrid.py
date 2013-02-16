import roots_Hybrid
import numpy
import math
'''
Adam Hollock 2/8/2013
The hybrid algorithm uses a combination of the incremental and the false
position to obtain exact roots at a rapid pace.
'''

def f(x): return math.sin(x)- 3*math.cos(x**2)+ 2*(math.sin(x))**2

print roots_Hybrid.hybrid(f, -5.0, 5.0, 500, 0.1)
import os
import cf_poly_rlse
import numpy
import random
from StringIO import StringIO

'''
Adam Hollock 2/7/2013
This is a recursive polynomial least square fit function test package. This
will load in various data from text files, seperate them into two arrays 
(via numpy,) and will then plot each file for each case, and linearize the 
data to fit better.
'''


#TEST CASE
f = open('target.txt','r')
rawTrackingData = f.read()
days = numpy.array(rawTrackingData.split()[::2], dtype=float)
meters = numpy.array(rawTrackingData.split()[1::2], dtype=float)
xnew = numpy.array([random.random() for i in range(0, 100)])
ynew = numpy.array([[random.random() for i in range(0, 100)]])
cf_poly_rlse.poly_rlse(days, meters, xnew, ynew, 3)

import os
import cf_polyfit
import numpy
from StringIO import StringIO

'''
Adam Hollock 2/8/2013
This is a polynomial curve fitting function, implemented weighted least 
squares if the standard deviation for each point is provided. This file
will load in various data from text files, seperate them into two arrays 
(via numpy,) and will then plot each file for each case, and linearize the 
data to fit better.
'''

'''
#TEST CASE 1
f = open('tracking.txt','r')
rawTrackingData = f.read()
days = numpy.array(rawTrackingData.split()[::2], dtype=float)
meters = numpy.array(rawTrackingData.split()[1::2], dtype=float)
cf_polyfit.polyfit(days, meters, 3)
'''

'''
#TEST CASE 2
#NOT RECOMMENDED
#USE CF_POLY_RLSE
f = open('target.txt','r')
rawTargetData = f.read()
days = numpy.array(rawTargetData.split()[::2], dtype=float)
meters = numpy.array(rawTargetData.split()[1::2], dtype=float)
cf_polyfit.polyfit(days, meters, 3)
'''
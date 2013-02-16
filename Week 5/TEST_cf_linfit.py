import os
import cf_linfit
import numpy
from StringIO import StringIO

'''
Adam Hollock 2/5/2013
This is a linear fitting function test package. This will load in various
data from text files, seperate them into two arrays (via numpy,) and will
then plot each file for each case, and linearize the data to fit better.
'''

'''
#TEST THE LINEAR CASE
f = open('resistor.txt','r')
rawResistorData = f.read()
amps = numpy.array(rawResistorData.split()[::2], dtype=float)
volts = numpy.array(rawResistorData.split()[1::2], dtype=float)
cf_linfit.linfit(amps, volts, 'linear')
'''

'''
#TEST THE EXPONENTIAL CASE
f = open('decay.txt','r')
rawDecayData = f.read()
days = numpy.array(rawDecayData.split()[::2], dtype=float)
position = numpy.array(rawDecayData.split()[1::2], dtype=float)
cf_linfit.linfit(days, position, 'exponential')
'''

'''
#TEST THE POWER CASE
f = open('radiance.txt','r')
rawRadianceData = f.read()
temp = numpy.array(rawRadianceData.split()[::2], dtype=float)
power = numpy.array(rawRadianceData.split()[1::2], dtype=float)
cf_linfit.linfit(temp, power, 'power')
'''

'''
#TEST THE SATURATION CASE
f = open('bacteria.txt','r')
rawBacteriaData = f.read()
time = numpy.array(rawBacteriaData.split()[::2], dtype=float)
growth = numpy.array(rawBacteriaData.split()[1::2], dtype=float)
cf_linfit.linfit(time, growth, 'saturation')
'''
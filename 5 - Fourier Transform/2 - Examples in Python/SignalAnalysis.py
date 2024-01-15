#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep  8 12:21:51 2021

@author: ianagulo
"""

import numpy as np
import math
import matplotlib.pyplot as plt

f = 261.63    # Hertz
T = 1/f       # seconds
n = 1
t = np.arange(0,(n*T),T/100)
x = 2*f*t

for i in range(0,200,10):
    phi = i*math.pi/100
    y = np.sin(math.pi*x + phi)
    plt.plot(x,y,'ko')
    plt.xlabel('Radians ($\pi$)')
    plt.ylabel('Sine Function')
    plt.pause(0.2)

t = np.arange(0,(2*T),T/100)
Fs = [1*f, 2*f, 4*f, 8*f, 16*f, 32*f]
for i in range(len(Fs)):
    plt.subplot(3,2,i+1)
    y = np.sin(2*math.pi*f*t)
    plt.plot(t,y,'k')
    plt.xlabel('Time (s)')
    plt.ylabel('Sine Function')
    plt.xlim([0, 2*T])
    plt.show()
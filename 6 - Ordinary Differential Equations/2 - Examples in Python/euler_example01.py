#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 08:16:11 2020

@author: ianagulo
"""

import matplotlib.pyplot as plt
import numpy as np

def f(x):
    y = -2*pow(x,3) + 12*pow(x,2) - 20*x + 8.5
    return y

# analytical solution
xtrue = np.arange(0,4,0.01)
ytrue = -0.5*pow(xtrue,4) + 4*pow(xtrue,3) -10*pow(xtrue,2) +8.5*xtrue + 1
plt.plot(xtrue,ytrue,linewidth=5)
plt.grid()

# this is where we use Euler's method to solve for y
h = 0.5             # define step size
x = np.arange(0,4+h,h)
y = np.zeros(len(x))
y[0]=1
for i in range(0,len(x)-1):
    y[i+1] = y[i] + f(x[i])*h
plt.plot(x,y,'o')
plt.show()


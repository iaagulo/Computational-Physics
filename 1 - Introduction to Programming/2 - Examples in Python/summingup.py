#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Aug 17 19:27:48 2020

@author: ianagulo
"""
import numpy as np

def summingup(minim, maxim, step):
    sum = 0
#    for i in range(minim, maxim, step):
    for i in np.arange(minim, maxim+step, step):
        sum += i

    return sum

print(round(summingup(1,10,0.1),3))
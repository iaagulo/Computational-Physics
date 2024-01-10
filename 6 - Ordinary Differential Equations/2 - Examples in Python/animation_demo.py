#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 10:46:07 2020

@author: ianagulo
"""

import matplotlib.pyplot as plt
import numpy as np
# please install celluloid by typing 
# in the command below in your console
# pip install celluloid
from celluloid import Camera
import time

deg = 360
step = 1
t = np.arange(0,deg+step,step)
current = np.sin(t*np.pi/180)

fig = plt.figure()
camera = Camera(fig)
for i in range(0,len(current)-1):
    plt.plot(t,current,'k',linewidth=5)
    plt.plot(t[i],current[i],'ro')
    plt.xlim([0, 360])
    plt.ylim([-1.1, 1.1])
    plt.xticks(np.arange(0,360+45,45))
    plt.grid()
    plt.show()
    time.sleep(0.01)
    camera.snap()

anim = camera.animate()
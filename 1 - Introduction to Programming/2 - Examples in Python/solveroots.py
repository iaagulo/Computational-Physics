#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Aug 14 17:39:20 2020

@author: ianagulo
"""
import cmath

# step 1 define coefficients
a = 0
b = 2
c = 1

# step 2 define discriminant and first term
discriminant = pow(b,2) - 4*a*c

# step 3 solve for roots and show results
if a != 0:
    firstterm = -b/(2*a)
    if discriminant == 0:
        print("The solution is " + str(firstterm) +".")
    elif discriminant > 0:
        xone = firstterm + cmath.sqrt(discriminant)/(2*a)
        xtwo = firstterm - cmath.sqrt(discriminant)/(2*a)
        print("The solutions are " + str(round(xone.real,2)) + " and " + str(round(xtwo.real,2)) + ".")    
    else:
        xone = (- b + cmath.sqrt(discriminant))/(2*a)
        xtwo = (- b - cmath.sqrt(discriminant))/(2*a)
        print("The solutions are " + str(round(firstterm,2)) + " + " + str(round(xone.imag,2)) + "j and " + str(round(firstterm,2)) + " - " + str(round(xone.imag,2)) + "j.")
else:
    print(round(-c/b,2))
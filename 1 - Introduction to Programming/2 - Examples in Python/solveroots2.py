#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Aug 14 21:36:15 2020

@author: ianagulo
"""

import cmath

# step 1 define coefficients
a = 1
b = 2
c = 3

# step 2 define discriminant
discriminant = pow(b,2) - 4*a*c

# step 3 solve for roots
if a != 0:
    sol1 = (-b-cmath.sqrt(discriminant))/(2*a)
    sol1 = complex(round(sol1.real,2), round(sol1.imag,2))
    sol2 = (-b+cmath.sqrt(discriminant))/(2*a)
    sol2 = complex(round(sol2.real,2), round(sol2.imag,2))
    print('The solution are {0} and {1}'.format(sol1,sol2))
else:
    sol = round(-c/b,4)
    print('The solution is {0}'.format(sol))


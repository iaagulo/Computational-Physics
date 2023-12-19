import numpy as np

sum = 0
#for i in range(minim, maxim, step):
for i in np.arange(1, 10.1, 0.1):
    sum += i

print(sum)
import matplotlib.pyplot as plt
import numpy as np

maxval = 4*np.pi
t = np.arange(-maxval, maxval+0.1, 0.1) # in units of seconds
y = np.sin( t )
z = np.cos( t )
plt.figure(figsize=[4,3])
plt.plot(t,y,linewidth=3,color='b',linestyle='-.')
plt.plot(t,z,linewidth=3,color='r',linestyle='-.')
plt.title('These are the sine and cosine functions.',fontsize=16)
plt.xlabel('$\omega$ (radians)',fontsize=12)
plt.ylabel('Amplitude (arb. units',fontsize=12)
plt.legend(['sine','cosine'],loc='upper right')
plt.savefig('sinecos.png',dpi=600)
plt.show()
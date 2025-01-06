pi = 3.14159
e = 1.602*10**-19
k = 1.281*10**-23
h = 6.626*10**-34
t1 = 4*pi*e*(k**2/h**3)
t2 = 4000**2
t3 = 2.7**((e*5)/(k*4000))
print('t1 = ', t1)
print('t2 = ', t2)
print('t3 = ', t3)
print('ans = ', t1*t2*t3)
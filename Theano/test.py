import theano.tensor as T
import numpy as np
from theano import function

#basic
x=T.scalar('x')
y=T.scalar('y')
z = x+y
f = function([x,y],z)
print(f(2,3))

#to pretty-print the function
from theano import pp
print(pp(z))

#matrix
x = T.dmatrix('x')
y = T.dmatrix('y')
# z = T.dot(x,y)
z = x+y
f = function([x,y],z)
print(f(np.arange(12).reshape((3,4)),   #f(input,output)
        10 * np.ones((3,4))))
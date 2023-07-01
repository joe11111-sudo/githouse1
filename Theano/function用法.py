import numpy as np
import theano.tensor as T
import theano

#activation function example    (search web)
x=T.dmatrix('x')
s=1/(1+T.exp(-x)) #np.exp() logistic or soft step
logistic = theano.function([x],s) #f(input,output)
print(logistic([[0,1],[-2,-3]]))


#multiply outputs for a function
a,b = T.dmatrices('a','b')
diff = a - b    #差值
abs_diff = abs(diff)    #差绝对值
diff_squared = diff**2  #差平方
f = theano.function([a,b],[diff,abs_diff,diff_squared])
print(f(np.ones((2,2)),
        np.arange(4).reshape((2,2))))

print('---------------------------------------------------')
#name for a function
x,y,w = T.dscalars('x','y','w')
z=(x+y) *w
f=theano.function([x,
                   theano.In(y,value=1),
                   theano.In(w,value=2,name='weights')],
                  z)
print(f(23,2,weights=4))


def f(a,b,c):
    return a+b*c

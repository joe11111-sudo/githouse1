import numpy as np
import theano.tensor as T
import theano

state = theano.shared(np.array(0,dtype=np.float64))
inc = T.scalar('inc',dtype=state.dtype)
accumulator = theano.function([inc],state,updates=[(state,state+inc)])
print(accumulator(10))
print(accumulator(10))

print('===========================')
#go get varieble value
print(state.get_value())
accumulator(1)
print(state.get_value())
accumulator(10)
print(state.get_value())

print('===========================')
#to set variable val
state.set_value(-1)
accumulator(3)
print(state.get_value())

print('===========================')
#temporarily repalce shared val  with another val
tmp_func = state*2 + inc
a = T.scalar(dtype=state.dtype)
skip_shared = theano.function([inc,a],tmp_func,givens=[(state,a)])
print(skip_shared(2,3))
print(state.get_value())

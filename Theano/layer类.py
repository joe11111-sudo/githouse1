from __future__ import print_function
import theano
import theano.tensor as T
import numpy as np
import matplotlib.pyplot as plt


class Layer(object):
    def __init__(self, inputs, in_size, out_size, activation_function=None):
        #共享变量(shared)，其初始值为从正态分布中采样出的随机数，均值为0，标准差为1，维度为（in_size, out_size）。
        self.W = theano.shared(np.random.normal(0, 1, (in_size, out_size)))
        #全零numpy数组，然后加上0.1的偏置
        self.b = theano.shared(np.zeros((out_size, )) + 0.1)
        #返回它们的矩阵乘积
        self.Wx_plus_b = T.dot(inputs, self.W) + self.b

        self.activation_function = activation_function  #激活函数
        if activation_function is None:
            self.outputs = self.Wx_plus_b
        else:
            self.outputs = self.activation_function(self.Wx_plus_b)


# Make up some fake data
#创建了一个名为x_data的一维数组，其中包含300个在-1和1之间均匀分布的数值。然后，使用[:, np.newaxis]语法将x_data重塑为一个有300行、1列的二维数组。
x_data = np.linspace(-1, 1, 300)[:, np.newaxis]
#从均值为0，标准差为0.05的正态分布中随机抽取的。
noise = np.random.normal(0, 0.05, x_data.shape)

y_data = np.square(x_data) - 0.5 + noise        # 噪声的函数y=x^2-0.5的数据点集

# show the fake data
plt.scatter(x_data, y_data)
plt.show()

# determine the inputs dtype 输入数据是两个矩阵x和y
x = T.dmatrix("x")
y = T.dmatrix("y")

# add layers
#l1层的输入是x，输出大小是10，激活函数是ReLU
l1 = Layer(x, 1, 10, T.nnet.relu)
l2 = Layer(l1.outputs, 10, 1, None)

# compute the cost 即预测值和实际值之间的平方误差的平均值
cost = T.mean(T.square(l2.outputs - y))

# compute the gradients
#使用随机梯度下降来更新网络的参数（l1.W，l1.b，l2.W和l2.b），以最小化损失。更新步长为learning_rate * gradient，其中gradient是网络参数的梯度
gW1, gb1, gW2, gb2 = T.grad(cost, [l1.W, l1.b, l2.W, l2.b])

# apply gradient descent 随机梯度下降（SGD）
learning_rate = 0.05 #学习率（learning_rate）被设置为0.05，用于调整每个参数的更新步长。

train = theano.function(
    inputs=[x, y],
    outputs=[cost],
    updates=[(l1.W, l1.W - learning_rate * gW1),
             (l1.b, l1.b - learning_rate * gb1),
             (l2.W, l2.W - learning_rate * gW2),
             (l2.b, l2.b - learning_rate * gb2)])

# prediction
predict = theano.function(inputs=[x], outputs=l2.outputs)

# plot the real data
fig = plt.figure()
ax = fig.add_subplot(1,1,1)
ax.scatter(x_data, y_data)
plt.ion()
plt.show()

for i in range(1000):
    # training
    err = train(x_data, y_data)
    if i % 50 == 0:
        # to visualize the result and improvement
        try:
            ax.lines.remove(lines[0])
        except Exception:
            pass
        prediction_value = predict(x_data)
        # plot the prediction
        lines = ax.plot(x_data, prediction_value, 'r-', lw=5)
        plt.pause(.5)
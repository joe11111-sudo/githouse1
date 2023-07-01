from __future__ import print_function
import numpy as np
import theano
import theano.tensor as T
"""定义了一个函数compute_accuracy，用于计算模型在给定目标标签y_target和预测标签y_predict下的准确率。
生成一个大小为N×feats的随机数据集D，其中输入变量是N个大小为feats的随机向量，目标标签是N个随机二进制数。
使用Theano库定义了两个符号变量x和y，分别表示输入数据和目标标签。
使用Theano库定义了两个共享变量W和b，分别表示逻辑回归模型的权重和偏差，初始值随机生成。
定义了一个符号变量y_pred，表示模型的预测标签，其值为对输入数据进行线性变换后通过sigmoid函数得到的概率值。
定义了一个符号变量loss，表示交叉熵损失函数，用于衡量模型预测的概率值与真实标签之间的差距。
定义了一个符号变量grad，表示损失函数对权重和偏差的梯度。
定义了一个Theano函数train，用于执行一次梯度下降更新权重和偏差，并返回当前的损失值。
循环执行多次train函数，每次更新模型参数，直到损失值收敛或达到最大迭代次数。
计算模型在训练集D上的准确率，并打印输出。"""

def compute_accuracy(y_target, y_predict):
    correct_prediction = np.equal(y_predict, y_target)
    accuracy = np.sum(correct_prediction)/len(correct_prediction)
    return accuracy

rng = np.random

N = 400                                   # training sample size
feats = 784                               # number of input variables

# generate a dataset: D = (input_values, target_class)
D = (rng.randn(N, feats), rng.randint(size=N, low=0, high=2))

# Declare Theano symbolic variables
x = T.dmatrix("x")
y = T.dvector("y")

# initialize the weights and biases
W = theano.shared(rng.randn(feats), name="w")
b = theano.shared(0., name="b")


# Construct Theano expression graph
p_1 = T.nnet.sigmoid(T.dot(x, W) + b)   # Logistic Probability that target = 1 (activation function)
prediction = p_1 > 0.5                    # The prediction thresholded
xent = -y * T.log(p_1) - (1-y) * T.log(1-p_1) # Cross-entropy loss function
# or
# xent = T.nnet.binary_crossentropy(p_1, y) # this is provided by theano
cost = xent.mean() + 0.01 * (W ** 2).sum()# The cost to minimize (l2 regularization)
gW, gb = T.grad(cost, [W, b])             # Compute the gradient of the cost


# Compile
learning_rate = 0.1
train = theano.function(
          inputs=[x, y],
          outputs=[prediction, xent.mean()],
          updates=((W, W - learning_rate * gW), (b, b - learning_rate * gb)))
predict = theano.function(inputs=[x], outputs=prediction)

# Training
for i in range(500):
    pred, err = train(D[0], D[1])
    if i % 50 == 0:
        print('cost:', err)
        print("accuracy:", compute_accuracy(D[1], predict(D[0])))

print("target values for D:")
print(D[1])
print("prediction on D:")
print(predict(D[0]))

import numpy as np
import collections as c

data = np.array([
    [154,1],
    [126,2],
    [70,2],
    [196,2],
    [161,2],
    [371,4]
])
#输入值
feature = (data[:,0])

label = data[:,-1]

#预测点
predictPoint = 200

#计算每个prediction point 的距离
distance = list(map(lambda x:abs(200-x) ,feature))

print(distance)

#排序
print(np.sort(distance))

#对distance的集合元素从小到大排序   （下标排序）
sortindex = np.argsort(distance)

#用排序sortindex来操作label集合
print(label[sortindex])

sortadlabel = np.array([2,2,2,3,3,2,3,4,1,1,2,3,3,3,3,3,1])
#knn算法的k 取最近的三个邻居
k = 3
print(c.Counter(sortadlabel[0:k]).most_common(1)[0][0])



#print(c.Counter(sortadlabel).most_common(1))
#print(c.Counter(sortadlabel).most_common(1)[0])    #输出最多的元素，和数量
#print(c.Counter(sortadlabel).most_common(1)[0][0]) #取数组中最多的数



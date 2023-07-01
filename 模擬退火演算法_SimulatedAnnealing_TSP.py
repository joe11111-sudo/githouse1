import numpy
import matplotlib.pyplot as plt
import sys
import time

class Coordinate:
    def __init__(self,x ,y):
        self.x=x
        self.y=y

    @staticmethod
    def get_distance(a, b):
        return numpy.sqrt(numpy.abs(a.x-b.x)+numpy.abs(a.y-b.y))

    @staticmethod
    def get_total_distance(coords):
        dist=0
        for first, second in zip(coords[:-1], coords[1:]):
            dist += Coordinate.get_distance(first, second)
        dist += Coordinate.get_distance(coords[0], coords[-1])
        return dist



if __name__ == '__main__':

    start = time.time()
    #coordinates
    coords = []
    for i in range(10):
        coords.append(Coordinate(numpy.random.uniform(),numpy.random.uniform()))

    #plot
    fig =plt.figure(figsize=(10, 5))
    ax1 = fig.add_subplot(121)
    ax2 = fig.add_subplot(122)
    for first, second in zip(coords[:-1], coords[1:]):
        ax1.plot([first.x, second.x], [first.y, second.y], 'b')
    ax1.plot([coords[0].x, coords[-1].x], [coords[0].y, coords[-1].y], 'b')
    for c in coords:
        ax1.plot(c.x, c.y, 'ro')

    #Simulated annealing algorith
    cost0 = Coordinate.get_total_distance(coords)
    T = 500    #set
    factor = 0.99  #set
    T_init = T
    for i in range(1000):   #set
        print(i, 'cost=', cost0)

        T = T * factor
        for j in range(100):    #set
            #Exchange two coordinates and get new neighbour solution
            r1, r2 = numpy.random.randint(0, len(coords), size=2)

            temp = coords[r1]
            coords[r1] = coords[r2]
            coords[r2] = temp

            #get the new cost
            cost1 = Coordinate.get_total_distance(coords)

            if cost1 < cost0:    # new solution
                cost0 = cost1
            else:
                # accept the new worse solution with given a probability
                x = numpy.random.uniform()
                if x < numpy.exp((cost0-cost1)/T):
                    cost0 = cost1
                else:
                    #do not accept the solution
                    temp = coords[r1]
                    coords[r1] = coords[r2]
                    coords[r2] = temp

    #plot the result
    for first, second in zip(coords[:-1], coords[1:]):
        ax2.plot([first.x, second.x], [first.y, second.y], 'b')
    ax2.plot([coords[0].x, coords[-1].x], [coords[0].y, coords[-1].y], 'b')
    for c in coords:
        ax2.plot(c.x, c.y, 'ro')

    plt.show()
    end = time.time()
    print('程序执行时间: ', end - start)



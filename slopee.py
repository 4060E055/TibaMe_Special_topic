import math
a = [(66, 36), (66, 41), (65, 37), (65, 41), (65, 45), (62, 37), (62, 41), (60, 37), (60, 41)]

def slopee(x1,y1,a):
    #slope_i = (y2 - y1) / (x2 - x1)
    #return slope_i
    slope = 99
    for i in range(len(a)):
        x2 = a[i][0]
        y2 = a[i][1]
        # x2 = a[i+1][0]
        # y2 = a[i+1][1]
        # print(x1)
        # print(y1)
        slope_i = math.sqrt(((y2 - y1)**2) + ((x2 - x1)**2))
        print(slope_i)
        #平方開根號
        if (slope_i) < slope:
            slope = slope_i
            px=x2
            py=y2
    return px,py
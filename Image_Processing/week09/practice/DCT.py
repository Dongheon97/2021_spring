import numpy as np
import cv2

def C(w, n=8):
    if w==0:
        return (1/n)**0.5
    else:
        return (2/n)**0.5

def Spatial2Frequency1(block, n=8):
    y, x = block.shape
    dst = np.zeros((y, x))
    v, u = dst.shape
    for v_ in range(v):
        for u_ in range(u):
            temp = 0
            for y_ in range(y):
                for x_ in range(x):
                    temp += block[y_, x_] * np.cos(((2*x_+1)*u_*np.pi)/(2*n))*np.cos(((2*y_+1)*v_*np.pi)/(2*n))

            dst[v_, u_] = C(u_, n=n)*C(v_, n=n)*temp

    dst = np.round(dst, 4)
    return dst

def Spatial2Frequency2(block, n=8):
    dst = np.zeros(block.shape)
    v, u = dst.shape
    y, x = np.mgrid[0:u, 0:v]

    for v_ in range(v):
        for u_ in range(u):
            temp = block*np.cos(((2*x+1)*u_*np.pi)/(2*n)) * np.cos(((2*y+1)*v_*np.pi)/(2*n))
            dst[v_, u_] = C(u_, n=n) * C(v_, n=n) * np.sum(temp)

    dst = np.round(dst, 4)
    return dst

if __name__ == '__main__':
    block_size = 4
    src = np.random.randn(block_size, block_size)
    src = np.round(src, 4)
    print(src)

    print('Spatial2Frequency1')
    dst = Spatial2Frequency1(src, n=block_size)
    print(dst)

    print('Spatial2Frequency2')
    dst = Spatial2Frequency2(src, n=block_size)
    print(dst)
import cv2
import numpy as np

import os
import sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.filtering import my_filtering
from my_library.gaussian_mask import my_get_Gaussian2D_mask, my_get_Gaussian1D_mask

def my_gaussian_pyramids(src, repeat, gap=2, msize=3, sigma=1, pad_type='zero'):
    dsts_down = []
    dsts_up = []
    dsts_down.append(src.copy())
    gaus2D = my_get_Gaussian2D_mask(msize, sigma)
    for i in range(repeat):
        dsts_down.append(my_gaussian_downsampling(dsts_down[i], gap, gaus2D, pad_type))

    dsts_up.append(dsts_down[repeat])
    for i in range(repeat):
        dsts_up.append(my_gaussian_upsampling(dsts_up[i], gap))

    return dsts_down, dsts_up

def my_gaussian_downsampling(src, gap, mask, pad_type):
    (h, w) = src.shape

    # gaussian filter O
    blur_img = my_filtering(src, mask, pad_type)

    # gaussian filter X
    #blur_img = src.copy()

    dst = np.zeros((h//gap, w//gap))
    (h_dst, w_dst) = dst.shape
    for row in range(h_dst):
        for col in range(w_dst):
            dst[row, col] = blur_img[row*gap, col*gap]

    return dst

def my_gaussian_upsampling(src, gap):
    (h, w) = src.shape

    dst = np.zeros((h*gap, w*gap))
    (h_dst, w_dst) = dst.shape
    for row in range(h_dst):
        for col in range(w_dst):
            dst[row, col] = src[row//gap, col//gap]

    return dst

if __name__ == '__main__':
    msize = 10
    y, x = np.mgrid[-2:2:5j, -2:2:5j]
    print(msize//2)
    print(x)
    print(y)
    '''
    src = cv2.imread('Lena.png', cv2.IMREAD_GRAYSCALE)
    src = src.astype(np.float32)

    dst_gaus_down, dst_gaus_up = my_gaussian_pyramids(src, 2, msize=3, sigma=1, pad_type='repetition')
    for i in range(len(dst_gaus_down)):
        img = dst_gaus_down[i]
        #img = np.clip(img, 0, 255)
        #img = (img+0.5).astype(np.uint8)
        img = ((img - img.min())/(img.max()-img.min())*255).astype(np.uint8)
        cv2.imshow('gaussian dst%d downsampling'%i, img)

    for i in range(len(dst_gaus_up)):
        img = dst_gaus_up[i]
        img = ((img - img.min())/(img.max()-img.min())*255).astype(np.uint8)
        cv2.imshow('gaussian dst%d upsampling'%i, img)

    cv2.waitKey()
    cv2.destroyAllWindows()
    '''
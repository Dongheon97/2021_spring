import cv2
import numpy as np

import os
import sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.filtering import my_filtering

def get_sobel():
    derivative = np.array([[-1, 0, 1]])
    blur = np.array([[1], [2], [1]])

    x = np.dot(blur, derivative)
    y = np.dot(derivative.T, blur.T)

    return x, y

def main():
    sobel_x, sobel_y = get_sobel()

    src = cv2.imread('../img/Lena.png', cv2.IMREAD_GRAYSCALE)
    #src_float = src.astype(np.float32)

    dst_x = my_filtering(src, sobel_x, 'zero')
    dst_y = my_filtering(src, sobel_y, 'zero')
    dst = np.abs(dst_x) + np.abs(dst_y)
    ret, dst_threshold = cv2.threshold(dst, 100, 255, cv2.THRESH_BINARY)

    print('ret : ', ret)
    cv2.imshow('before threshold', dst/255)
    cv2.imshow('after threshold', dst_threshold/255)
    cv2.waitKey()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()
'''
    # normalizing
    dst_x_norm = (dst_x - np.min(dst_x)) / np.max(dst_x - np.min(dst_x))
    dst_y_norm = (dst_y - np.min(dst_y)) / np.max(dst_y - np.min(dst_y))
'''

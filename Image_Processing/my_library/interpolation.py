import cv2
import numpy as np

import os
import sys

sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.padding import my_padding

def my_bilinear(src, scale):

    (h, w) = src.shape
    h_dst = int(h * scale + 0.5)
    w_dst = int(w * scale + 0.5)
    dst = np.zeros((h_dst, w_dst))

    # bilinear interpolation 적용
    if(scale < 1):
        for row in range(h_dst):
            for col in range(w_dst):
                dst[row, col] = src[int(row*(1/scale)), int(col*(1/scale))]     # float to int

    else:   # scale>=1
        src_pad = my_padding(src, (1, 1), 'repetition')
        for row in range(h_dst):
            for col in range(w_dst):
                t = int(row/scale)
                s = int(col/scale)
                t_ = float(row/scale) - t
                s_ = float(col/scale) - s
                dst[row, col] = (1-t_)*(1-s_)*src_pad[t, s] + (s_)*(1-t_)*src_pad[t, s+1] \
                                + (1-s_)*(t_)*src_pad[t+1, s] + (s_)*(t_)*src_pad[t+1, s+1]
    return dst
'''
if __name__ == '__main__':
    src = cv2.imread('Lena.png', cv2.IMREAD_GRAYSCALE)

    scale = 1/7
    #이미지 크기 1/2배로 변경
    my_dst_mini = my_bilinear(src, scale)
    my_dst_mini = my_dst_mini.astype(np.uint8)

    #이미지 크기 2배로 변경(Lena.png 이미지의 shape는 (512, 512))
    my_dst = my_bilinear(my_dst_mini, 1/scale)
    my_dst = my_dst.astype(np.uint8)
    cv2.imshow('original', src)
    cv2.imshow('my bilinear mini', my_dst_mini)
    cv2.imshow('my bilinear', my_dst)

    cv2.waitKey()
    cv2.destroyAllWindows()
'''


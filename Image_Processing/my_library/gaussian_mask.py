import numpy as np
import cv2
import time
import math # For pi

# library add
import os
import sys

sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.padding import my_padding


def my_get_Gaussian2D_mask(msize, sigma=1):
    # 2D gaussian filter 만들기
    # msize = 정수
    odd_even = msize%2
    if odd_even == 1:
        y, x = np.mgrid[-(msize//2):(msize//2)+1, -(msize//2):(msize//2)+1]
    else :
        y, x = np.mgrid[-(msize//2):(msize//2), -(msize//2):(msize//2)]

    # 2차 gaussian mask 생성
    gaus2D = np.zeros((msize, msize), dtype=np.float32)

    # 값을 계산하기 위한 mask 생성
    gaus2D += (1/(2*math.pi*(sigma**2))) * np.exp(-((x**2)+(y**2))/(2*(sigma**2)))

    # gaus2D의 총 합 = 1
    gaus2D /= np.sum(gaus2D)
    return gaus2D


def my_get_Gaussian1D_mask(msize, sigma=1):
    # 1D gaussian filter 만들기
    x = np.zeros((1, msize), dtype=np.float32)
    for i in range(msize):
        x[0, i] = i-(msize//2)

    # 1차 gaussian mask 생성
    gaus1D = np.zeros((1, msize), dtype=np.float32)

    # 계산을 위한 mask 생성
    gaus1D += (1/(math.sqrt(2*math.pi)*sigma)) * np.exp(-(x**2)/(2*(sigma**2)))

    # mask의 총 합 = 1
    gaus1D /= np.sum(gaus1D)
    return gaus1D


def my_filtering(src, mask, pad_type='zero'):
    (h, w) = src.shape
    # mask의 크기
    (m_h, m_w) = mask.shape
    # 직접 구현한 my_padding 함수를 이용
    pad_img = my_padding(src, (m_h // 2, m_w // 2), pad_type)

    print('<mask>')
    print(mask)

    # 시간을 측정할 때 만 이 코드를 사용하고 시간측정 안하고 filtering을 할 때에는
    # 4중 for문으로 할 경우 시간이 많이 걸리기 때문에 2중 for문으로 사용하기.
    dst = np.zeros((h, w))
    for row in range(h):
        for col in range(w):
            sum = 0
            for m_row in range(m_h):
                for m_col in range(m_w):
                    sum += pad_img[row + m_row, col + m_col] * mask[m_row, m_col]
            dst[row, col] = sum
    return dst

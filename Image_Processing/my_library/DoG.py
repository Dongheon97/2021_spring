import cv2
import numpy as np


def get_DoG_filter(fsize, sigma=1):
    # 1D gaussian mask 만들기
    x = np.mgrid[-(fsize // 2):(fsize // 2) + 1, ]
    #x = np.zeros((1, fsize), dtype=np.float32)
    #for i in range(fsize):
    #    x[0, i] = i - (fsize // 2)
    y = x.T

    # Gaussian 공식 적용 (1D -> 2D)
    DoG_x = -(x/(sigma**2))*np.exp(-((x**2)+(y**2))/(2*(sigma**2)))
    DoG_y = -(y/(sigma**2))*np.exp(-((x**2)+(y**2))/(2*(sigma**2)))

    # 총 합을 1로 만든다.-> divide by zero (error)
    #DoG_x /= np.sum(DoG_x)
    #DoG_y /= np.sum(DoG_y)

    return DoG_x, DoG_y




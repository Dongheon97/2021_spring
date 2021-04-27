import cv2
import numpy as np

# library add
import os, sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.filtering import my_filtering

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

def main():
    src = cv2.imread('IMG_7982.JPG', cv2.IMREAD_GRAYSCALE)
    DoG_x, DoG_y = get_DoG_filter(fsize=3, sigma=1)

    # DoG mask sigma값 조절해서 mask 만들기
    # DoG_x, DoG_y filter 확인
    x, y = get_DoG_filter(fsize=256, sigma=40)
    x = ((x - np.min(x)) / np.max(x - np.min(x)) * 255).astype(np.uint8)
    y = ((y - np.min(y)) / np.max(y - np.min(y)) * 255).astype(np.uint8)

    dst_x = my_filtering(src, DoG_x, 'zero')
    dst_y = my_filtering(src, DoG_y, 'zero')

    ###################################################
    # TODO                                            #
    # dst_x, dst_y 를 사용하여 magnitude 계산            #
    ###################################################
    #dst = np.sqrt(dst_y**2) + np.sqrt(dst_x**2)
    dst = np.abs(dst_y) + np.abs(dst_x)

    # normalizing
    #dst_norm = (dst - np.min(dst)) / np.max(dst - np.min(dst))

    cv2.imshow('DoG_x filter', x)
    cv2.imshow('DoG_y filter', y)
    cv2.imshow('dst_x', dst_x/255)
    cv2.imshow('dst_y', dst_y/255)
    cv2.imshow('dst', dst/255)
    #cv2.imwrite('practice2.JPG', dst_norm)
    cv2.waitKey()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()


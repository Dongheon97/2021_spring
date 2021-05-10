import numpy as np
import cv2
import time

# library add
import os, sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.padding import my_padding
from my_library.filtering import my_filtering
from my_library.gaussian_mask import my_get_Gaussian2D_mask

def my_normalize(src):
    dst = src.copy()
    dst *= 255
    dst = np.clip(dst, 0, 255)
    return dst.astype(np.uint8)

def add_gaus_noise(src, mean=0, sigma=0.1):
    #src : 0 ~ 255, dst : 0 ~ 1
    dst = src/255
    h, w = dst.shape
    noise = np.random.normal(mean, sigma, size=(h, w))
    dst += noise
    return my_normalize(dst)

def my_bilateral(src, msize, sigma, sigma_r, pos_x, pos_y, pad_type='zero'):
    (h, w) = src.shape
    dst = np.zeros((h, w))
    m_s = int(msize / 2)
    for i in range(h):
        print('\r%d / %d ...' % (i, h), end="")
        for j in range(w):
            if i < m_s or j < m_s:
                dst[i, j] = src[i, j]
            elif i >= h - m_s or j >= w - m_s:
                dst[i, j] = src[i, j]
            else:
                mask = []
                for k in range(i - m_s, i + m_s + 1):
                    for l in range(j - m_s, j + m_s + 1):
                        G = np.exp(-((((i - k) ** 2) + ((j - l) ** 2)) / (2 * sigma ** 2)))
                        temp = src[i, j]
                        temp = np.array(temp, dtype=int)
                        temp2 = src[k, l]
                        temp2 = np.array(temp2, dtype=int)
                        B = np.exp(-(((temp - temp2) ** 2) / (2 * sigma_r ** 2)))
                        mask.append(G * B)
                mask = np.array(mask).reshape(msize, msize)
                mask = mask / np.sum(mask)

                dst[i, j] = np.sum(src[i - m_s:i + m_s + 1, j - m_s:j + m_s + 1] * mask)
                if i == 51 and j == 121:
                    print(mask.sum())
                    mask_img = cv2.resize(mask, (200, 200), interpolation=cv2.INTER_NEAREST)
                    mask_img = my_normalize(mask_img)
                    cv2.imshow('mask', mask_img)
                    img = src[i - m_s:i + m_s + 1, j - m_s:j + m_s + 1]
                    img = cv2.resize(img, (200, 200), interpolation=cv2.INTER_NEAREST)
                    img = my_normalize(img)
                    cv2.imshow('img', img)
                    cv2.waitKey()
                    cv2.destroyAllWindows()
    dst = my_normalize(dst)
    return dst



if __name__ == '__main__':
    start = time.time()
    src = cv2.imread('Lena.png', cv2.IMREAD_GRAYSCALE)
    np.random.seed(seed=100)

    pos_y = 0
    pos_x = 0
    src_line = src.copy()
    src_line[pos_y-4:pos_y+5, pos_x-4:pos_x+5] = 255
    src_line[pos_y-2:pos_y+3, pos_x-2:pos_x+3] = src[pos_y-2:pos_y+3, pos_x-2:pos_x+3]
    src_noise = add_gaus_noise(src, mean=0, sigma=0.1)
    src_noise = src_noise/255

    ######################################################
    # TODO                                               #
    # my_bilateral, gaussian mask 채우기                  #
    ######################################################
    dst = my_bilateral(src_noise, 5, 5, 50, pos_x, pos_y)
    dst = my_normalize(dst)

    gaus2D = my_get_Gaussian2D_mask(5 , sigma = 10)
    dst_gaus2D= my_filtering(src_noise, gaus2D)
    dst_gaus2D = my_normalize(dst_gaus2D)

    cv2.imshow('original', src_line)
    cv2.imshow('gaus noise', src_noise)
    cv2.imshow('my gaussian', dst_gaus2D)
    cv2.imshow('my bilateral', dst)
    total_time = time.time() - start
    print('\ntime : ', total_time)
    if total_time > 25:
        print('감점 예정입니다. 코드 수정을 추천드립니다.')
    cv2.waitKey()
    cv2.destroyAllWindows()


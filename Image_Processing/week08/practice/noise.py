import numpy as np
import cv2

# library
import os, sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.padding import my_padding

def my_filtering(src, filter, pad_type='zero'):
    (h, w) = src.shape
    (f_h, f_w) = filter.shape
    src_pad = my_padding(src, (f_h//2, f_w//2), pad_type)
    dst = np.zeros((h, w))

    for row in range(h):
        for col in range(w):
            val = np.sum(src_pad[row:row+f_h, col:col+f_w] * filter)
            dst[row, col] = val

    return dst

def my_normailze(src):
    dst = src.copy()
    dst *= 255
    dst = np.clip(dst, 0, 255)
    return dst.astype(np.uint8)

def add_gaus_noise(src, mean=0, sigma=0.1):
    dst = src/255
    h, w = dst.shape
    noise = np.random.normal(mean, sigma, size=(h, w))
    dst += noise
    return my_normailze(dst)

def main():
    np.random.seed(seed=100)
    src = cv2.imread('../../imgs/Lena.png', cv2.IMREAD_GRAYSCALE)
    dst_noise = add_gaus_noise(src, mean=0, sigma=0.1)

    #mask_size = 5
    #mask = np.ones((mask_size, mask_size)) / (mask_size**2)
    #dst = my_filtering(dst_noise, mask)
    #dst = dst.astype(np.uint8)
    h, w = src.shape
    num = 100

    imgs = np.zeros((num, h, w))
    for i in range(num):
        imgs[i] = add_gaus_noise(src, mean=0, sigma=0.5)

    dst = np.mean(imgs, axis=0).astype(np.uint8)

    cv2.imshow('original', src)
    cv2.imshow('add gaus noise', dst_noise)
    cv2.imshow('noise removal', dst)
    cv2.waitKey()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()


'''
def main():
    rand_norm = np.random.normal(0, 1, size=5)
    print(rand_norm)

    rand_norm2 = np.random.normal(0, 1, size=(3,3))
    print(rand_norm2)

if __name__ == '__main__':
    main()
    

def main():
    np.random.seed(seed=100)
    src = cv2.imread('../../imgs/Lena.png', cv2.IMREAD_GRAYSCALE)
    dst_noise = add_gaus_noise(src, mean=0, sigma=0.3)

    cv2.imshow('original', src)
    cv2.imshow('add gaus noise', dst_noise)
    cv2.waitKey()
    cv2.destroyAllWindows()

'''
import cv2
import numpy as np


def main():
    # src = cv2.imread('rice.png', cv2.IMREAD_GRAYSCALE)
    src = cv2.imread('circles_adaptive_threshold.png', cv2.IMREAD_GRAYSCALE)
    val, dst = cv2.threshold(src, 0, 255, cv2.THRESH_OTSU)
    print('< cv2.threshold >')
    print(val)

    cv2.imshow('original', src)
    cv2.imshow('threshold', dst)
    cv2.waitKey()
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()
import cv2
import numpy as np

def adaptive_threshold(src, group_num, axis = 0):
    # direction은 row, col만 가능
    assert axis in [0, 1]
    h, w = src.shape

    # 가로 방향 split
    if axis == 0:
        img_split = np.vsplit(src, group_num)
    # 세로 방향 split
    elif axis == 1:
        img_split = np.hsplit(src, group_num)

    dst = None
    threshold_value = []
    for img in img_split:
        if dst is None:
            val, dst_split = cv2.threshold(img, 0, 255, cv2.THRESH_OTSU)
            threshold_value.append(val)
            dst = dst_split
        else:
            val, dst_split = cv2.threshold(img, 0, 255, cv2.THRESH_OTSU)
            threshold_value.append(val)
            dst = np.append(dst, dst_split, axis=axis)

    return dst, threshold_value


def main():
    arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    arr1 = np.array([0, 1, 2, 3,4, 5, 6,7,8,9])
    print(np.sum(arr*arr1))
    print(np.sum(np.multiply(arr, arr1)))
    '''
    src = cv2.imread('circles_adaptive_threshold.png', cv2.IMREAD_GRAYSCALE)
    dst, val = adaptive_threshold(src, group_num=4, axis=1)
    print('< cv2.threshold >')
    print(val)

    cv2.imshow('original', src)
    cv2.imshow('threshold', dst)
    cv2.waitKey()
    cv2.destroyAllWindows()
    '''
if __name__ == '__main__':
    main()
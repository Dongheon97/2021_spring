import cv2
import numpy as np

def my_padding(src, pad_shape, pad_type='zero'):
    # Zero Padding
    (h, w) = src.shape
    (p_h, p_w) = pad_shape
    pad_img = np.zeros((h+2*p_h, w+2*p_w))
    pad_img[p_h:p_h+h, p_w:p_w+w] = src

    # Repetition Padding
    if pad_type == 'repetition':
        print('repetition padding')
        # up
        pad_img[:p_h, p_w:p_w+w] = src[0, :]
        # down
        pad_img[p_h+h:, p_w:p_w+w] = src[h-1, :]
        # left
        pad_img[:, :p_w] = pad_img[:, p_w:p_w+1]
        # right
        pad_img[:, p_w+w:] = pad_img[:, p_w+w-1:p_w+w]

    else:
        print('zero padding')

    return pad_img

def my_filtering(src, mask, pad_type='zero'):
    (h, w) = src.shape
    (h_m, w_m) = mask.shape
    src_pad = my_padding(src, (h_m, w_m), pad_type)
    dst = np.zeros((h, w))
    for row in range(h):
        for col in range(w):
            val = np.sum(src_pad[row:row+h_m, col:col+w_m]*mask)
            val = np.clip(val, 0, 255)
            dst[row, col] = val

    dst = (dst+0.5).astype(np.uint8)
    return dst
'''
    if ftype == 'average':
        print('average filtering')
        mask = np.ones(fshape)
        mask = mask/(fshape[0]*fshape[1])
        #mask 확인
        print(mask)

    elif ftype == 'sharpening':
        print('sharpening filtering')
        base_mask = np.zeros(fshape)
        base_mask[fshape[0]//2, fshape[1]//2] = 2
        aver_mask = np.ones(fshape)
        aver_mask = aver_mask/(fshape[0]*fshape[1])
        mask = base_mask - aver_mask
        #mask 확인
        print(mask)
'''



'''
if __name__ == '__main__':
    src = cv2.imread('Lena.png', cv2.IMREAD_GRAYSCALE)

    # repetition padding test
    rep_test = my_padding(src, (20,20), 'repetition')

    # 3x3 filter
    #dst_average = my_filtering(src, 'average', (3,3))
    #dst_sharpening = my_filtering(src, 'sharpening', (3,3))

    #원하는 크기로 설정
    dst_average = my_filtering(src, 'average', (21, 19))
    dst_sharpening = my_filtering(src, 'sharpening', (21, 19))

    # 11x13 filter
    #dst_average = my_filtering(src, 'average', (11,13), 'repetition')
    #dst_sharpening = my_filtering(src, 'sharpening', (11,13), 'repetition')

    cv2.imshow('original', src)
    cv2.imshow('average filter', dst_average)
    cv2.imshow('sharpening filter', dst_sharpening)
    cv2.imshow('repetition padding test', rep_test.astype(np.uint8))
    cv2.waitKey()
    cv2.destroyAllWindows()
'''
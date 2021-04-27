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
    src_pad = my_padding(src, (h_m//2, w_m//2), pad_type)
    dst = np.zeros((h, w))
    for row in range(h):
        for col in range(w):
            val = np.sum(src_pad[row:row+h_m, col:col+w_m]*mask)
            #val = np.clip(val, 0, 255)
            dst[row, col] = val

    #dst = (dst+0.5).astype(np.uint8)
    return dst

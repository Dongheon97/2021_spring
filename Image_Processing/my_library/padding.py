
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
'''
def my_padding(src, pad_shape, pad_type='zero'):
    # Zero Padding
    (h, w) = src.shape
    (p_h, p_w) = pad_shape
    pad_img = np.zeros((h+2*p_h, w+2*p_w))
    pad_img[p_h:p_h+h, p_w:p_w+w] = src

    # Repetition Padding
    if pad_type == 'repetition':
        print('repetition padding')
        # Edge
        for row in range(p_h):
            for col in range(p_w):
                # left_upper
                pad_img[row, col] += src[0, 0]
                # right_upper
                pad_img[row, (w + p_w) + col] += src[0, w - 1]
                # left_under
                pad_img[(h + p_h) + row, col] += src[h - 1, 0]
                # right_under
                pad_img[(h + p_h) + row, (w + p_w) + col] += src[h - 1, w - 1]

        for row in range(p_h):
            for col in range(w):
                # up
                pad_img[row, p_w + col] = src[0, col]
                # down
                pad_img[(h + p_h) + row, p_w + col] = src[h - 1, col]

        for row in range(h):
            for col in range(p_w):
                # left
                pad_img[p_h + row, col] = src[row, 0]
                # right
                pad_img[p_h + row, (w + p_w) + col] = src[row, w - 1]

    else:
        print('zero padding')

    return pad_img
'''
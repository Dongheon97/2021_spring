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

def my_filtering(src, ftype, fshape, pad_type='zero'):
    (h, w) = src.shape
    src_pad = my_padding(src, (fshape[0]//2, fshape[1]//2), pad_type)
    dst = np.zeros((h, w))

    sum = fshape[0]*fshape[1]
    if ftype == 'average':
        print('average filtering')
        mask = np.full(fshape, 1/sum)
        #mask 확인
        print(mask)

    elif ftype == 'sharpening':
        print('sharpening filtering')
        v1 = np.zeros(fshape)                    # mask's frame
        v1[fshape[0]//2, fshape[1]//2] += 2      # middle value of mask's
        v2 = np.full(fshape, 1/sum)              # average mask
        mask = v1-v2
        #mask 확인
        print(mask)

    for row in range(h):
        for col in range(w):
            src_mask = np.ones(fshape)
            src_mask *= src_pad[row:row+fshape[0], col:col+fshape[1]]
            masked = np.sum(src_mask*mask)
            # overflow 처리
            if (masked <= 0):
                masked = 0
            if (masked >= 255):
                masked = 255
            dst[row, col] = masked

    dst = (dst+0.5).astype(np.uint8)
    return dst



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

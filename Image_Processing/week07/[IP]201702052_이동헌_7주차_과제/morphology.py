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


def dilation(B, S):
    h_s = S.shape[0] // 2
    w_s = S.shape[1] // 2
    # S로 filtering 하므로 S.shape//2 만큼 zero padding
    B_pad = my_padding(B, (h_s, w_s), 'zero')
    (h_p, w_p) = B_pad.shape
    B_zero = np.zeros((h_p, w_p))
    for row in range(1, h_p - 1):
        for col in range(1, w_p - 1):
            if (B_pad[row, col] != 0):
                B_zero[row - h_s:(row + h_s) + 1, col - w_s:(col + w_s) + 1] += S
    # 값 보정
    for row in range(h_p):
        for col in range(w_p):
            if (B_zero[row, col] > 1):
                B_zero[row, col] = 1
    dst = B_zero[h_s:h_p-h_s, w_s:w_p-w_s]
    return dst

def erosion(B, S):
    h_s = S.shape[0] // 2
    w_s = S.shape[1] // 2
    # S로 filtering 하므로 S.shape//2 만큼 zero padding
    B_pad = my_padding(B, (h_s, w_s), 'zero')
    (h_p, w_p) = B_pad.shape
    B_zero = np.zeros((h_p, w_p), dtype=np.uint8)
    for row in range(1, h_p - 1):
        for col in range(1, w_p - 1):
            if (B_pad[row, col] != 0):
                B_mask = B_pad[row - h_s:(row + h_s) + 1, col - w_s:(col + w_s) + 1]
                # 0 또는 1의 값만 존재하므로 둘을 곱하여서 구분
                mult_BS = np.multiply(B_mask.astype(np.int32), S)
                # np.array_equal : array 비교 함수
                if (np.array_equal(mult_BS, S)):
                    B_zero[row, col] += 1
    dst = B_zero[h_s:h_p-h_s, w_s:w_p-w_s]
    return dst

def opening(B, S):
    # (B erosion S) dilation S
    dst = dilation(erosion(B, S), S)
    return dst

def closing(B, S):
    # (B dilation S) erosion S
    dst = erosion(dilation(B, S), S)
    return dst

if __name__ == '__main__':
    B = np.array(
        [[0, 0, 0, 0, 0, 0, 0, 0],
         [1, 1, 1, 1, 1, 1, 1, 0],
         [0, 0, 0, 1, 1, 1, 1, 0],
         [0, 0, 0, 1, 1, 1, 1, 0],
         [0, 0, 1, 1, 1, 1, 1, 0],
         [0, 0, 0, 1, 1, 1, 1, 0],
         [0, 0, 0, 0, 0, 0, 0, 0]])

    S = np.array(
        [[1, 1, 1],
         [1, 1, 1],
         [1, 1, 1]])

    cv2.imwrite('morphology_B.png', (B*255).astype(np.uint8))

    img_dilation = dilation(B, S)
    img_dilation = (img_dilation*255).astype(np.uint8)
    print(img_dilation)
    cv2.imwrite('morphology_dilation.png', img_dilation)

    img_erosion = erosion(B, S)
    img_erosion = (img_erosion * 255).astype(np.uint8)
    print(img_erosion)
    cv2.imwrite('morphology_erosion.png', img_erosion)

    img_opening = opening(B, S)
    img_opening = (img_opening * 255).astype(np.uint8)
    print(img_opening)
    cv2.imwrite('morphology_opening.png', img_opening)

    img_closing = closing(B, S)
    img_closing = (img_closing * 255).astype(np.uint8)
    print(img_closing)
    cv2.imwrite('morphology_closing.png', img_closing)


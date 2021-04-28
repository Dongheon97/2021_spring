import cv2
import numpy as np

# library add
import os, sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.padding import my_padding


def dilation(B, S):
    # S로 filtering 하므로 S.shape//2 만큼 zero padding
    B_pad = my_padding(B, (1, 1), 'zero')
    (h_p, w_p) = B_pad.shape
    B_zero = np.zeros((h_p, w_p))
    for row in range(1, h_p-1):
        for col in range(1, w_p-1):
            if(B_pad[row, col] != 0):
                B_zero[row - 1:(row + 1) + 1, col - 1:(col + 1) + 1] += S
    # 값 보정
    for row in range(h_p):
        for col in range(w_p):
            if(B_zero[row, col] > 1):
                B_zero[row, col] = 1
    # dst 값 추출
    dst = B_zero[1:h_p-1, 1:w_p-1]
    return dst

def erosion(B, S):
    (h, w) = B.shape
    h_s = S.shape[0] // 2
    w_s = S.shape[1] // 2
    # S로 filtering 하므로 S.shape//2 만큼 zero padding
    B_pad = my_padding(B, (h_s, w_s), 'zero')
    (h_p, w_p) = B_pad.shape
    dst = np.zeros((h,w), dtype=np.uint8)
    for row in range(1, h_p - 1):
        for col in range(1, w_p - 1):
            if (B_pad[row, col] != 0):
                if((B_pad[row-1, col-1] == 1) and (B_pad[row-1, col] == 1) and (B_pad[row-1, col+1] == 1)
                    and (B_pad[row, col-1] == 1) and (B_pad[row, col+1] == 1)
                    and (B_pad[row+1, col-1] == 1) and (B_pad[row+1, col] == 1) and (B_pad[row+1, col+1] == 1)):
                    dst[row-1, col-1] += 1
    return dst

def opening(B, S):
    dst = dilation(erosion(B, S), S)
    return dst

def closing(B, S):
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

    S2 = np.array(
        [[1, 1, 1],
         [1, 1, 1],
         [1, 1, 1],
         [1, 1, 1]])

    S3 = np.array(
        [[1, 1, 1, 1],
         [1, 1, 1, 1],
         [1, 1, 1, 1]])

    S4 = np.array(
        [[1, 1, 1, 1],
         [1, 1, 1, 1],
         [1, 1, 1, 1],
         [1, 1, 1, 1]])


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


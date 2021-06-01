import numpy as np
import cv2

def forward(src, M):
    print('< forward >')
    print('M')
    print(M)
    h, w = src.shape

    dst = np.zeros((h+20, w+34))
    img = dst.copy()
    img[10:h+10, 17:w+17] = src
    src = img.copy()
    N = np.zeros(dst.shape)


    for row in range(h):
        for col in range(w):
            P = np.array([[col], [row], [1]])

            P_dst = np.dot(M, P)
            dst_col = P_dst[0][0]
            dst_row = P_dst[1][0]

            dst_col_right = int(np.ceil(dst_col))
            dst_col_left = int(dst_col)

            dst_row_bottom = int(np.ceil(dst_row))
            dst_row_top = int(dst_row)

            dst[dst_row_top, dst_col_left] += src[row, col]
            N[dst_row_top, dst_col_left] += 1

            if dst_col_right != dst_col_left:
                dst[dst_row_top, dst_col_right] += src[row, col]
                N[dst_row_top, dst_col_right] += 1

            if dst_row_bottom != dst_row_top:
                dst[dst_row_bottom, dst_col_left] += src[row, col]
                N[dst_row_bottom, dst_col_left] += 1

            if dst_col_right != dst_col_left and dst_row_bottom != dst_row_top:
                dst[dst_row_bottom, dst_col_right] += src[row, col]
                N[dst_row_bottom, dst_col_right] += 1

    dst = np.round(dst/(N + 1E-6))
    dst = dst.astype(np.uint8)
    return dst

def backward(src, M):
    print('< backward >')
    print('M')
    print(M)
    dst = np.zeros((200, 200))

    # backward 에서는 필요 없음
    # N = np.zeros(dst.shape)

    h, w = dst.shape
    h_src, w_src = src.shape

    # M inv 구하기
    M_inv = np.linalg.inv(M)
    print('M inv')
    print(M_inv)

    for row in range(h):
        for col in range(w):
            P_dst = np.array([[col], [row], [1]])

            P = np.dot(M_inv, P_dst)

            src_col = P[0][0]
            src_row = P[1][0]

            src_col_right = int(np.ceil(src_col))
            src_col_left = int(src_col)

            src_row_bottom = int(np.ceil(src_row))
            src_row_top = int(src_row)

            if src_col_right >= w_src or src_row_bottom >= h_src:
                continue

            s = src_col - src_col_left
            t = src_row - src_row_top

            intensity = (1-s) * (1-t) * src[src_row_top, src_col_left] \
                    + (s) * (1-t) * src[src_row_top, src_col_right] \
                    + (1-s) * (t) * src[src_row_bottom, src_col_left] \
                    + (s) * (t) * src[src_row_bottom, src_col_right]

            dst[row, col] = intensity
    dst = dst.astype(np.uint8)
    return dst


def main():

    src = np.full((100, 100), 255, dtype=np.uint8)
    #box = np.full((20, 20), 250, dtype=np.uint8)

    #src[30:50, 30:50] = box

    # translation
    M_tr = np.array([[1, 0, 50],
                    [0, 1, 100],
                    [0, 0, 1]])

    M = np.array([[0.43564, 0.26498, -10],
                  [-0.07704, 0.50405, 22],
                  [0, 0, 1
                   ]])



    h, w = (512, 512)
    img = np.full((h, w), 255, dtype = np.uint8)

    row1 = np.ceil(np.dot(M, np.array([[0], [0], [1]])))  # (0,0)이 변환되는 좌표
    row2 = np.ceil(np.dot(M, np.array([[h], [w], [1]]))) # (h, w)가 변환되는 좌표
    col1 = np.ceil(np.dot(M, np.array([[0], [w], [1]])))  # (h, 0)이 변환되는 좌표
    col2 = np.ceil(np.dot(M, np.array([[h], [0], [1]])))  # (0, w)가 변환되는 좌표

    print(M)
    '''
    h1 = row2[0] - row1[0]
    w1 = col1[1] - col2[1]

    M_inv = np.linalg.inv(M)

    row11 = np.dot(M_inv, np.array([[0], [0], [1]]))  # (0,0)이 변환되는 좌표
    row22 = np.dot(M_inv, np.array([[h1], [w1], [1]]))  # (h, w)가 변환되는 좌표
    col11 = np.dot(M_inv, np.array([[0], [w1], [1]]))  # (h, 0)이 변환되는 좌표
    col22 = np.dot(M_inv, np.array([[h1], [0], [1]]))  # (0, w)가 변환되는 좌표

    h2 = row2[0] - row1[0]
    w2 = col1[1] - col2[1]
    
    dst_for = forward(src, (M_tr))
    dst_back = backward(src, (M_tr))
    
    dst_for = forward(src, (M_tr))
    dst_back = backward(src, (M_tr))
    '''

    dst_for = forward(img, (M))
    #dst_back = backward(img, (M))
    dst_for2 = forward(dst_for, np.linalg.inv(M))
    #dst_back2 = backward(dst_back, np.linalg.inv(M_tr))

    cv2.imshow('original', src)
    cv2.imshow('forward', dst_for)
    #cv2.imshow('backward', dst_back)

    cv2.imshow('forward2', dst_for2)
    #cv2.imshow('backward2', dst_back2)

    cv2.waitKey()
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()
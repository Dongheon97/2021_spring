import numpy as np
import cv2

def forward(src, M, fit=False):
    #####################################################
    # TODO                                              #
    # forward 완성                                      #
    #####################################################
    print('< forward >')
    print('M')
    print(M)

    h, w = src.shape

    # fit 한 경우 (window 밖은 잘라낸다)
    # fit size
    if (fit == True):
        dst = np.zeros((src.shape))
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

                if dst_col_right >= w or dst_row_bottom >= h:
                    continue

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

    # fit == False // Full size
    else:
        upper_right = np.array([[h], [0], [1]])
        lower_right = np.array([[h], [w], [1]])
        x = np.ceil(np.dot(M, upper_right)).astype(np.int32)
        y = np.ceil(np.dot(M, lower_right)).astype(np.int32)

        h_ = h-(x[1])
        w_ = y[0]

        dst = np.zeros((h_[0], w_[0]))

        img = dst.copy()

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

    print(h_[0])
    print(-x[1][0])
    print(h_[0]+x[1][0])

    dst = np.round(dst / (N + 1E-6))
    dst = dst.astype(np.uint8)

    cv2.imshow('dst', dst)

    img[0:-x[1][0], :] = dst[h_[0] + x[1][0]:, :]
    img[-x[1][0]:, :] = dst[0:h_[0] + x[1][0], :]
    cv2.imshow('img', img)

    return img

def backward(src, M, fit=False):
    #####################################################
    # TODO                                              #
    # backward 완성                                      #
    #####################################################
    print('< backward >')
    print('M')
    print(M)

    h_src, w_src = src.shape

    # fit size
    if (fit == True):
        dst = np.zeros((h_src, w_src))

        h, w = dst.shape

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

                intensity = (1 - s) * (1 - t) * src[src_row_top, src_col_left] \
                            + (s) * (1 - t) * src[src_row_top, src_col_right] \
                            + (1 - s) * (t) * src[src_row_bottom, src_col_left] \
                            + (s) * (t) * src[src_row_bottom, src_col_right]

                dst[row, col] = intensity

    # full size
    else:
        dst = np.zeros((3* h_src, 5 * w_src))

        h, w = dst.shape

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

                s = src_col - src_col_left
                t = src_row - src_row_top

                intensity = (1 - s) * (1 - t) * src[src_row_top, src_col_left] \
                            + (s) * (1 - t) * src[src_row_top, src_col_right] \
                            + (1 - s) * (t) * src[src_row_bottom, src_col_left] \
                            + (s) * (t) * src[src_row_bottom, src_col_right]

                dst[row, col] = intensity

    dst = dst.astype(np.uint8)
    return dst

def main():
    src = cv2.imread('Lena.png', cv2.IMREAD_GRAYSCALE)
    #####################################################
    # TODO                                              #
    # M 완성                                             #
    # M_tr, M_sc ... 등등 모든 행렬 M 완성하기              #
    #####################################################
    # translation
    M_tr = np.array([[1, 0, -30],
                     [0, 1, +50],
                     [0, 0, 1]
                     ])

    # scaling
    M_sc = np.array([[0.5, 0, 0],
                     [0, 0.5, 0],
                     [0, 0, 1]
                     ])

    # rotation
    degree = -20    # 60분법
    M_ro = np.array([[np.cos(np.deg2rad(degree)), -np.sin(np.deg2rad(degree)), 0],
                     [np.sin(np.deg2rad(degree)), np.cos(np.deg2rad(degree)), 0],
                     [0, 0, 1]
                     ])

    # shearing
    M_sh = np.array([[1, 0.2, 0],
                     [0.2, 1, 0],
                     [0, 0, 1]
                     ])

    # rotation -> translation -> Scale -> Shear
    M = np.dot(M_sh, np.dot(M_sc, np.dot(M_tr, M_ro)))

    # fit이 True인 경우와 False인 경우 다 해야 함.
    fit = True
    # forward
    #dst_for = forward(src, M, fit=fit)
    #dst_for2 = forward(dst_for, np.linalg.inv(M), fit=fit)
    #cv2.imshow('forward2', dst_for2)

    dst_for = forward(src, M_ro)
    dst_for2 = forward(dst_for, np.linalg.inv(M))
    cv2.imshow('forward2', dst_for)

    # backward
    #dst_back = backward(src, M, fit=fit)
    #dst_back2 = backward(dst_back, np.linalg.inv(M), fit=fit)
    #cv2.imshow('backward2', dst_back2)

    #dst_back = backward(src, M)
    #dst_back2 = backward(dst_back, np.linalg.inv(M))
    #cv2.imshow('backward2', dst_back2)

    cv2.imshow('original', src)
    cv2.imshow('forward2', dst_for2)
    #cv2.imshow('backward2', dst_back2)
    cv2.waitKey()
    cv2.destroyAllWindows()

if __name__ =='__main__':
    main()
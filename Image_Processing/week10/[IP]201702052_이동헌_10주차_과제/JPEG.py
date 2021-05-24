import numpy as np
import cv2
import time

# library add
import os, sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.padding import my_padding

def C(w, n = 8):
    if w == 0:
        return (1/n)**0.5
    else:
        return (2/n)**0.5

def Quantization_Luminance():
    luminance = np.array(
        [[16, 11, 10, 16, 24, 40, 51, 61],
         [12, 12, 14, 19, 26, 58, 60, 55],
         [14, 13, 16, 24, 40, 57, 69, 56],
         [14, 17, 22, 29, 51, 87, 80, 62],
         [18, 22, 37, 56, 68, 109, 103, 77],
         [24, 35, 55, 64, 81, 104, 113, 92],
         [49, 64, 78, 87, 103, 121, 120, 101],
         [72, 92, 95, 98, 112, 100, 103, 99]])
    return luminance

def img2block(src, n=8):
    ######################################
    # TODO                               #
    # img2block 완성                      #
    # img를 block으로 변환하기              #
    ######################################
    (h, w) = src.shape
    # src의 row, col을 n으로 나눈 나머지
    h_ = h%n
    w_ = w%n
    blocks = []
    for i in range(h//n):
        for j in range(w//n):
            blocks.append(src[i*n:i*n+n, j*n:j*n+n])

    if (h_ == 0 and w_ ==0):
        return np.array(blocks).astype(np.float32)
    else:
        blocks = my_padding(src, (h_, w_), 'zero')
        return np.array(blocks).astype(np.float32)


def DCT(block, n=8):
    ######################################
    # TODO                               #
    # DCT 완성                            #
    ######################################
    dst = np.zeros((n, n))
    y, x = np.mgrid[0:n, 0:n]

    for v in range(n):
        for u in range(n):
            temp = block * np.cos(((2 * x + 1) * u * np.pi) / (2 * n)) * np.cos(((2 * y + 1) * v * np.pi) / (2 * n))
            dst[v, u] = C(v, n=n) * C(u, n=n) * np.sum(temp)
    return np.round(dst)

def my_zigzag_scanning(block, block_size=8):
    ######################################
    # TODO                               #
    # my_zigzag_scanning 완성             #
    ######################################
    #(h, w) = block.shape
    zigzag = np.zeros((block_size*block_size))
    index = 0
    row = 0
    col = 0
    changed = block_size
    for i in range(block_size):
        changed += i

    # 초기값 [0, 0]
    zigzag[index] = block[row, col]
    index += 1

    # 대각선을 기준으로 upper-left triangle
    while index < changed:
        # 방향 정하기
        # (row+col)가 홀수라면 왼쪽 아래로, 짝수라면 오른쪽 위로 방향을 설정했다.
        direction = (row + col) % 2
        # 짝수인 경우
        if direction == 0:
            col += 1
            while col != 0:
                zigzag[index] = block[row, col]
                index += 1
                row += 1
                col -= 1
            zigzag[index] = block[row, col]
            index += 1
        # 홀수인 경우
        else:
            row += 1
            while row != 0:
                zigzag[index] = block[row, col]
                index += 1
                row -= 1
                col += 1
            zigzag[index] = block[row, col]
            index += 1

    # 대각선을 기준으로 lower-right triangle
    while index < (block_size * block_size):
        direction = (row + col) % 2
        # 짝수인 경우
        if direction == 0:
            row += 1
            while row < block_size-1:
                zigzag[index] = block[row, col]
                index += 1
                col -= 1
                row += 1
            zigzag[index] = block[row, col]
            index += 1
        # 홀수인 경우
        else:
            col += 1
            while col < block_size-1:
                zigzag[index] = block[row, col]
                index += 1
                row -= 1
                col += 1
            zigzag[index] = block[row, col]
            index += 1

    compressed = []
    EOB = 0
    # 거꾸로 탐색
    for i in reversed(range(len(zigzag))):
        if zigzag[i] != 0:
            EOB = i+1
            break
    for i in range(EOB):
        compressed.append(zigzag[i])
    compressed.append('EOB')
    return compressed

def reverse_zigzag_sacnning(zigzag, block_size=8):
    block = np.zeros((block_size, block_size))

    # decompression
    decompressed = np.zeros((block_size*block_size))
    EOB = len(zigzag)
    decompressed[0:EOB-1] = zigzag[0:EOB-1]

    index = 0
    changed = block_size
    for i in range(block_size):
        changed += i

    # list => block
    index = 0
    row = 0
    col = 0
    changed = block_size
    for i in range(block_size):
        changed += i

    # 초기값 [0, 0]
    if zigzag[index] != 'EOB':
        block[0, 0] = zigzag[index]
    else:
        # 초기값이 'EOB'인 경우
        block[row, col] = 0
    index += 1

    # 대각선을 기준으로 upper-left triangle
    while index < changed:
        # 방향 정하기
        # (row+col)가 홀수라면 왼쪽 아래로, 짝수라면 오른쪽 위로 방향을 설정했다.
        direction = (row + col) % 2
        # 짝수인 경우
        if direction == 0:
            col += 1
            while col != 0:
                if index >= EOB-1:
                    block[row, col] = 0
                else:
                    block[row, col] = zigzag[index]
                index += 1
                row += 1
                col -= 1
            if index >= EOB-1:
                block[row, col] = 0
            else:
                block[row, col] = zigzag[index]
            index += 1
        # 홀수인 경우
        else:
            row += 1
            while row != 0:
                if index >= EOB-1:
                    block[row, col] = 0
                else:
                    block[row, col] = zigzag[index]
                index += 1
                row -= 1
                col += 1
            if index >= EOB-1:
                block[row, col] = 0
            else:
                block[row, col] = zigzag[index]
            index += 1

    # 대각선을 기준으로 lower-right triangle
    while index < (block_size * block_size):
        direction = (row + col) % 2
        # 짝수인 경우
        if direction == 0:
            row += 1
            while row < block_size - 1:
                if index >= EOB-1:
                    block[row, col] = 0
                else:
                    block[row, col] = zigzag[index]
                index += 1
                col -= 1
                row += 1
            if index >= EOB-1:
                block[row, col] = 0
            else:
                block[row, col] = zigzag[index]
            index += 1
        # 홀수인 경우
        else:
            col += 1
            while col < block_size - 1:
                if index >= EOB-1:
                    block[row, col] = 0
                else:
                    block[row, col] = zigzag[index]
                index += 1

                row -= 1
                col += 1
            if index >= EOB-1:
                block[row, col] = 0
            else:
                block[row, col] = zigzag[index]
            index += 1

    return block

def DCT_inv(block, n = 8):
    ###################################################
    # TODO                                            #
    # DCT_inv 완성                                     #
    # DCT_inv 는 DCT와 다름.                            #
    ###################################################
    dst = np.zeros((n, n))
    y, x = np.mgrid[0:n, 0:n]
    arr_C = np.zeros((n,n))

    for i in range(n):
        for j in range(n):
            arr_C[i, j] = C(i, n=n)*C(j, n=n)

    for v in range(n):
        for u in range(n):
            temp = arr_C * block * np.cos(((2 * u + 1) * x * np.pi) / (2 * n)) * np.cos(((2 * v + 1) * y * np.pi) / (2 * n))
            dst[v, u] = np.sum(temp)

    return np.round(dst)

def block2img(blocks, src_shape, n = 8):
    ###################################################
    # TODO                                            #
    # block2img 완성                                   #
    # 복구한 block들을 image로 만들기                     #
    ###################################################

    # len(blocks)의 루트 값으로 length를 구해 dst의 크기를 결정
    length = np.sqrt(len(blocks)).astype(np.int32)
    dst = np.zeros((n*length, n*length))

    index = 0
    for row in range(length):
        for col in range(length):
            dst[row*n:(row*n)+n, col*n:(col*n)+n] = blocks[index]
            index += 1

    # 원래의 이미지 복구
    (h, w) = src_shape
    h_ = h % 8
    w_ = w % 8
    # 원본 이미지의 h, w가 모두 8의 배수일 때
    if (h_==0) and (w_==0):
        return dst.astype(np.uint8)
    # 원본 이미지의 h, w가 8의 배수가 아닐 때
    else:
        return dst[h_:h_+h, w_:w_+w].astype(np.uint8)


def Encoding(src, n=8):
    #################################################################################################
    # TODO                                                                                          #
    # Encoding 완성                                                                                  #
    # Encoding 함수를 참고용으로 첨부하긴 했는데 수정해서 사용하실 분은 수정하셔도 전혀 상관 없습니다.              #
    #################################################################################################
    print('<start Encoding>')
    # img -> blocks
    blocks = img2block(src, n=n)

    #subtract 128
    blocks -= 128
    #DCT
    blocks_dct = []
    for block in blocks:
        blocks_dct.append(DCT(block, n=n))
    blocks_dct = np.array(blocks_dct)

    #Quantization + thresholding
    Q = Quantization_Luminance()
    QnT = np.round(blocks_dct / Q)

    # zigzag scanning
    zz = []
    for i in range(len(QnT)):
        zz.append(my_zigzag_scanning(QnT[i]))
    return zz, src.shape

def Decoding(zigzag, src_shape, n=8):
    #################################################################################################
    # TODO                                                                                          #
    # Decoding 완성                                                                                  #
    # Decoding 함수를 참고용으로 첨부하긴 했는데 수정해서 사용하실 분은 수정하셔도 전혀 상관 없습니다.              #
    #################################################################################################
    print('<start Decoding>')

    # zigzag scanning
    blocks = []
    for i in range(len(zigzag)):
        blocks.append(reverse_zigzag_sacnning(zigzag[i], block_size=n))
    blocks = np.array(blocks)

    # Denormalizing
    Q = Quantization_Luminance()
    blocks = blocks * Q

    # inverse DCT
    blocks_idct = []
    for block in blocks:
        blocks_idct.append(DCT_inv(block, n=n))
    blocks_idct = np.array(blocks_idct)

    # add 128
    blocks_idct += 128

    # block -> img
    dst = block2img(blocks_idct, src_shape=src_shape, n=n)

    return dst

def main():
    start = time.time()
    src = cv2.imread('Lena.png', cv2.IMREAD_GRAYSCALE)
    comp, src_shape = Encoding(src, n=8)

    # 과제의 comp.npy, src_shape.npy를 복구할 때 아래 코드 사용하기(위의 2줄은 주석처리하고, 아래 2줄은 주석 풀기)
    #comp = np.load('comp.npy', allow_pickle=True)
    #src_shape = np.load('src_shape.npy')

    recover_img = Decoding(comp, src_shape, n=8)
    total_time = time.time() - start

    print('time : ', total_time)
    if total_time > 45:
        print('감점 예정입니다.')
    cv2.imshow('recover img', recover_img)
    cv2.waitKey()
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()

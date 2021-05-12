import cv2
import numpy as np

#jpeg는 보통 block size = 8
def C(w, n = 8):
    if w == 0:
        return (1/n)**0.5
    else:
        return (2/n)**0.5


def Spatial2Frequency_mask(block, n = 8):
    # dst = sub_image
    dst = np.zeros(block.shape)
    v, u = dst.shape

    y, x = np.mgrid[0:u, 0:v]

    mask = np.zeros((n*n, n*n))

    for v_ in range(v):
        for u_ in range(u):
            ##########################################################################
            # ToDo                                                                   #
            # mask 만들기                                                             #
            # mask.shape = (16x16)                                                   #
            # DCT에서 사용된 mask는 (4x4) mask가 16개 있음 (u, v) 별로 1개씩 있음 u=4, v=4  #
            # 4중 for문으로 구현 시 감점 예정                                             #
            ###########################################################################
            temp = block * np.cos(((2*x+1)*u_*np.pi)/(2*n)) * np.cos(((2*y+1)*v_*np.pi)/(2*n))

            mask[(v_*n):(v_*n)+n, (u_*n):(u_*n)+n] = C(u_, n=n)*C(v_, n=n)*temp
    #mask = np.round(mask, 2)
    print(mask)
    mask = my_normalize(mask)
    return mask

def my_normalize(src):
    ##############################################################################
    # ToDo                                                                       #
    # my_normalize                                                               #
    # mask를 보기 좋게 만들기 위해 어떻게 해야 할 지 생각해서 my_normalize 함수 완성해보기   #
    ##############################################################################

    (h, w) = src.shape
    max = src[0,0]
    min = -src[0, 4]
    for row in range(h):
        for col in range(w):
            if(src[row, col] > max):
                src[row, col] = max
            elif(src[row, col] < min):
                src[row, col] = min

    #dst = (src - np.min(src)) / (np.max(src)-np.min(src)) * 255
    dst = ((src - np.min(src)) / np.max(src - np.min(src)) * 255).astype(np.uint8)
    return dst
    # dst = ((src - min) / (max - min) * 255).astype(np.uint8)
    # dst = ((src - np.min(src)) / np.max(src - np.min(src)) * 255).astype(np.uint8)

if __name__ == '__main__':
    block_size = 4
    src = np.ones((block_size, block_size))

    mask = Spatial2Frequency_mask(src, n=block_size)
    mask = mask.astype(np.uint8)
    print(mask)

    #크기가 너무 작으니 크기 키우기 (16x16) -> (320x320)
    mask = cv2.resize(mask, (320, 320), interpolation=cv2.INTER_NEAREST)

    cv2.imshow('201702052 mask', mask)
    cv2.waitKey()
    cv2.destroyAllWindows()




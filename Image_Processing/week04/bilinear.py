import cv2
import numpy as np

def my_bilinear(src, scale):

    (h, w) = src.shape
    h_dst = int(h * scale + 0.5)
    w_dst = int(w * scale + 0.5)

    dst = np.zeros((h_dst, w_dst))

    # bilinear interpolation 적용
    if(scale < 1):
        for row in range(h_dst):
            for col in range(w_dst):
                dst[row, col] = src[int(row*(1/scale)), int(col*(1/scale))]     # float to int

    else:   # scale>=1
        #scale_ = int(scale)
        for row in range(h_dst):
            for col in range(w_dst):
                t = row/scale
                s = col/scale
                t_ = row/scale - t
                s_ = col/scale - s
                #x = int(t)-1
                #y = int(s)-1
                #a = (1-t_)*(1-s_)*src[x, y]
                #b = s_*(1-t_)*src[x, y+1]
                #c = (1-s_)*t_*src[x+1, y]
                #d = s_*t_*src[x+1, y+1]
                #dst[row, col] = a + b + c + d
                dst[row, col] = (1-t_)*(1-s_)*src[int(t)-1, int(s)-1] + (s_)*(1-t_)*src[int(t)-1, int(s+1)-1] \
                                + (1-s_)*(t_)*src[int(t+1)-1, int(s)-1] + (s_)*(t_)*src[int(t+1)-1, int(s+1)-1]
    return dst

if __name__ == '__main__':
    src = cv2.imread('Lena.png', cv2.IMREAD_GRAYSCALE)

    scale = 1/7
    #이미지 크기 1/2배로 변경
    my_dst_mini = my_bilinear(src, scale)
    my_dst_mini = my_dst_mini.astype(np.uint8)

    #이미지 크기 2배로 변경(Lena.png 이미지의 shape는 (512, 512))
    my_dst = my_bilinear(my_dst_mini, 1/scale)
    my_dst = my_dst.astype(np.uint8)

    cv2.imshow('original', src)
    cv2.imshow('my bilinear mini', my_dst_mini)
    cv2.imshow('my bilinear', my_dst)

    cv2.waitKey()
    cv2.destroyAllWindows()



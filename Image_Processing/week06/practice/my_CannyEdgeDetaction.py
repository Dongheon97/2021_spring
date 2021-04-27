import cv2
import numpy as np
import math

def my_padding(src, pad_shape, pad_type='zero'):
    (h , w) = src.shape
    (p_h, p_w) = pad_shape
    pad_img = np.zeros((h + 2 * p_h, w + 2*p_w))
    pad_img[p_h:h+p_h,p_w:w+p_w] = src

    if pad_type == 'repetition':
        print('repetition padding')

        pad_img[:p_h, p_w:p_w + w] = src[0, :]
        pad_img[p_h + h:, p_w:p_w + w] = src[h - 1, :]
        pad_img[:, :p_w] = pad_img[:, p_w:p_w+1]
        pad_img[:, p_w + w:] = pad_img[:, p_w + w - 1:p_w + w]
    else:
        print('zero padding')

    return pad_img

def my_filtering(src, mask, pad_type='zero'):
    (h,w) = src.shape

    (m_h,m_w) = mask.shape

    pad_img = my_padding(src, (m_h//2, m_w //2), pad_type)
    dst = np.zeros((h, w))

    for row in range(h):
        for col in range(w):
            sum = 0
            for i in range(m_h):
                for j in range(m_w):
                    sum += pad_img[row + i, col+j] * mask[i,j]
            dst[row,col] = sum

    return dst

#low-pass filter를 적용 후 high-pass filter적용
def apply_lowNhigh_pass_filter(src, fsize, sigma=1, pad_type='zero'):
    y, x = np.mgrid[-(fsize // 2):(fsize//2) + 1, -(fsize // 2):(fsize//2) + 1]

    # DoG 필터를 사용하기위해 1차원 배열을 생성한다.
    DoG_x = (-x / sigma ** 2) * np.exp(-(x**2 + y **2)/ (2 * sigma **2))
    DoG_y = (-y / sigma ** 2) * np.exp(-(x ** 2 + y ** 2) / (2 * sigma ** 2))

    # 2차원 가우시안 편미분 공식을이용하여 x,y를 구현한다. x는 horizontal y는 vertical이다.
    Ix = my_filtering(src,DoG_x,'repetiton')
    Iy = my_filtering(src,DoG_y,'repetition')
    # 각각 이미지를 x,y축 필터링을 통해 이미지를 구한다.
    return Ix, Iy

#Ix와 Iy의 magnitude를 구함
def calcMagnitude(Ix, Iy):
    ##################################################
    # TODO                                           #
    # calcMagnitude 완성                             #
    # magnitude : ix와 iy의 magnitude를 계산         #
    #################################################
    magnitude = np.sqrt(Ix ** 2 + Iy ** 2)
    # magnitude 공식을 이용하여 하나의 이미지로 합산한다.
    return magnitude

#Ix와 Iy의 angle을 구함
def calcAngle(Ix, Iy):
    #######################################
    # TODO                                #
    # calcAngle 완성                      #
    # angle     : ix와 iy의 angle         #
    #######################################
    angle = np.degrees(np.arctan2(Iy, Ix))
    # 아크탄젠트(탄젠트역함수) 공식을 이용하여 360도로 환산한다.
    return angle

#non-maximum supression 수행
def non_maximum_supression(magnitude, angle):
    ####################################################################################
    # TODO                                                                             #
    # non_maximum_supression 완성                                                      #
    # larger_magnitude     : non_maximum_supression 결과(가장 강한 edge만 남김)         #
    ####################################################################################
    (h, w) = magnitude.shape
    larger_magnitude = np.zeros((h, w))
    m_test1 = 0
    m_test2 = 0
    # 예측값 변수 선언
    # 각 각도를 가지고 두 픽셀의 예측값을 선형보간법으로 구현한다.
    for row in range(1,h - 1):
        for col in range(1 , w - 1):
            if 0 <= angle[row][col] < 45:
                alpha = np.tan(np.radians(angle[row][col]))
                m_test1 = (1 - alpha) * magnitude[row][col + 1] + alpha * magnitude[row + 1][col + 1]
                m_test2 = (1 - alpha) * magnitude[row][col - 1] + alpha * magnitude[row - 1][col - 1]
            elif 45 <= angle[row][col] < 90:
                alpha = np.tan(np.radians(90 - angle[row][col]))
                m_test1 = (1 - alpha) * magnitude[row + 1][col] + alpha * magnitude[row + 1][col + 1]
                m_test2 = (1 - alpha) * magnitude[row - 1][col] + alpha * magnitude[row - 1][col - 1]
            elif 90 < angle[row][col] < 135:
                alpha = np.tan(np.radians(angle[row][col] - 90))
                m_test1 = (1 - alpha) * magnitude[row + 1][col] + alpha * magnitude[row + 1][col - 1]
                m_test2 = (1 - alpha) * magnitude[row - 1][col] + alpha * magnitude[row - 1][col + 1]
            elif 135 <= angle[row][col] < 180:
                alpha = np.tan(np.radians(180 - angle[row][col]))
                m_test1 = (1 - alpha) * magnitude[row][col - 1] + alpha * magnitude[row + 1][col - 1]
                m_test2 = (1 - alpha) * magnitude[row][col + 1] + alpha * magnitude[row - 1][col + 1]
            elif -180 <= angle[row][col] < -135:
                alpha = np.tan(np.radians(180 - np.abs(angle[row][col])))
                m_test1 = (1 - alpha) * magnitude[row][col + 1] + alpha * magnitude[row + 1][col + 1]
                m_test2 = (1 - alpha) * magnitude[row][col - 1] + alpha * magnitude[row - 1][col - 1]
            elif -135 <= angle[row][col] < -90:
                alpha = np.tan(np.radians(np.abs(angle[row][col]) - 90))
                m_test1 = (1 - alpha) * magnitude[row + 1][col] + alpha * magnitude[row + 1][col + 1]
                m_test2 = (1 - alpha) * magnitude[row - 1][col] + alpha * magnitude[row - 1][col - 1]
            elif -90 <= angle[row][col] < -45:
                alpha = np.tan(np.radians(90 - np.abs(angle[row][col])))
                m_test1 = (1 - alpha) * magnitude[row + 1][col] + alpha * magnitude[row + 1][col - 1]
                m_test2 = (1 - alpha) * magnitude[row - 1][col] + alpha * magnitude[row - 1][col + 1]
            elif -45 <= angle[row][col] < 0:
                alpha = np.tan(np.radians(np.abs(angle[row][col])))
                m_test1 = (1 - alpha) * magnitude[row][col - 1] + alpha * magnitude[row + 1][col - 1]
                m_test2 = (1 - alpha) * magnitude[row][col + 1] + alpha * magnitude[row - 1][col + 1]
            if magnitude[row][col] > m_test1 and magnitude[row][col] > m_test2:
                larger_magnitude[row][col] = magnitude[row][col]
            else:
                larger_magnitude[row][col] = 0

    larger_magnitude = (larger_magnitude / np.max(larger_magnitude) * 255).astype(np.uint8)
    cv2.imshow('non-maximum-suppression',larger_magnitude)
    return larger_magnitude

#double_thresholding 수행 high threshold value는 내장함수(otsu방식 이용)를 사용하여 구하고 low threshold값은 (high threshold * 0.4)로 구한다
def double_thresholding(src):
    ############################################
    # TODO                                     #
    # double_thresholding 완성                 #
    # dst     : 진짜 edge만 남은 image         #
    ###########################################
    (h, w) = src.shape
    dst = np.zeros((h, w),dtype=np.uint8)
    high_threshold_value, _ = cv2.threshold(src, 0, 255, cv2.THRESH_OTSU)
    low_threshold_value = high_threshold_value*0.4

    strong_row, strong_col = np.where(src >= high_threshold_value)
    weak_row, weak_col = np.where((src <= high_threshold_value) & (src >= low_threshold_value))

    dst[strong_row, strong_col] = 255
    dst[weak_row, weak_col] = 75

    top_to_bottom = dst.copy()

    for row in range(1, h):
        for col in range(1, w):
            if top_to_bottom[row, col] == 75:
                if top_to_bottom[row, col + 1] == 255 or top_to_bottom[row, col - 1] == 255 or top_to_bottom[
                    row - 1, col] == 255 or top_to_bottom[
                    row + 1, col] == 255 or top_to_bottom[
                    row - 1, col - 1] == 255 or top_to_bottom[row + 1, col - 1] == 255 or top_to_bottom[
                    row - 1, col + 1] == 255 or top_to_bottom[
                    row + 1, col + 1] == 255:
                    top_to_bottom[row, col] = 255
                else:
                    top_to_bottom[row, col] = 0

    bottom_to_top = dst.copy()

    for row in range(h - 1, 0, -1):
        for col in range(w - 1, 0, -1):
            if bottom_to_top[row, col] == 75:
                if bottom_to_top[row, col + 1] == 255 or bottom_to_top[row, col - 1] == 255 or bottom_to_top[
                    row - 1, col] == 255 or bottom_to_top[
                    row + 1, col] == 255 or bottom_to_top[
                    row - 1, col - 1] == 255 or bottom_to_top[row + 1, col - 1] == 255 or bottom_to_top[
                    row - 1, col + 1] == 255 or bottom_to_top[
                    row + 1, col + 1] == 255:
                    bottom_to_top[row, col] = 255
                else:
                    bottom_to_top[row, col] = 0

    right_to_left = dst.copy()

    for row in range(1, h):
        for col in range(w - 1, 0, -1):
            if right_to_left[row, col] == 75:
                if right_to_left[row, col + 1] == 255 or right_to_left[row, col - 1] == 255 or right_to_left[
                    row - 1, col] == 255 or right_to_left[
                    row + 1, col] == 255 or right_to_left[
                    row - 1, col - 1] == 255 or right_to_left[row + 1, col - 1] == 255 or right_to_left[
                    row - 1, col + 1] == 255 or right_to_left[
                    row + 1, col + 1] == 255:
                    right_to_left[row, col] = 255
                else:
                    right_to_left[row, col] = 0

    left_to_right = dst.copy()

    for row in range(w - 1, 0, -1):
        for col in range(1, h):
            if left_to_right[row, col] == 75:
                if left_to_right[row, col + 1] == 255 or left_to_right[row, col - 1] == 255 or left_to_right[
                    row - 1, col] == 255 or left_to_right[
                    row + 1, col] == 255 or left_to_right[
                    row - 1, col - 1] == 255 or left_to_right[row + 1, col - 1] == 255 or left_to_right[
                    row - 1, col + 1] == 255 or left_to_right[
                    row + 1, col + 1] == 255:
                    left_to_right[row, col] = 255
                else:
                    left_to_right[row, col] = 0

    dst = top_to_bottom + bottom_to_top + right_to_left + left_to_right

    dst[dst > 255] = 255

    return dst



def my_canny_edge_detection(src, fsize=5, sigma=1, pad_type='zero'):
    #low-pass filter를 이용하여 blur효과
    #high-pass filter를 이용하여 edge 검출
    #gaussian filter -> sobel filter 를 이용해서 2번 filtering을 해도 되고, DoG를 이용해 한번에 해도 됨
    Ix, Iy = apply_lowNhigh_pass_filter(src, fsize, sigma, pad_type)

    #magnitude와 angle을 구함
    magnitude = calcMagnitude(Ix, Iy)
    angle = calcAngle(Ix, Iy)

    #non-maximum suppression 수행
    larger_magnitude = non_maximum_supression(magnitude, angle)

    # #진짜 edge만 남김
    dst = double_thresholding(larger_magnitude)

    return dst


if __name__ =='__main__':
    src = cv2.imread('Lena.png', cv2.IMREAD_GRAYSCALE)
    dst = my_canny_edge_detection(src)
    cv2.imshow('original', src)
    cv2.imshow('my canny edge detection', dst)
    cv2.waitKey()
    cv2.destroyAllWindows()

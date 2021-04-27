import cv2
import numpy as np

# library add
import os, sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from my_library.DoG import get_DoG_filter
from my_library.filtering import my_filtering
from my_library.padding import my_padding

##################################################
## Linked List
class Node:
    def __init__(self, row, col):
        self.row = row
        self.col = col
        self.next = None

class LinkedList:
    # 초기화 메소드
    def __init__(self, ):
        self.num_of_data = 0
        self.head = Node(0, 0)


    def add(self, row, col):
        cur = self.head
        new = Node(row, col)
        self.head = new
        new.next = cur
        self.num_of_data += 1

    def remove(self):
        if (not self.isEmpty()):
            cur = self.head
            row = cur.row
            col = cur.col
            self.head = cur.next
            self.num_of_data -= 1
            return row, col

    def isEmpty(self):
        if(self.num_of_data == 0):
            return True
        return False

    def next(self):
        if self.current.next == None:
            return None
        self.before = self.current
        self.current = self.current.next

    def peek(self):
        cur = self.head
        row = cur.row
        col = cur.col
        return row, col

    def size(self):
        return self.num_of_data
##################################################

# low-pass filter를 적용 후 high-pass filter적용
def apply_lowNhigh_pass_filter(src, fsize, sigma=1):
    # low-pass filter를 이용하여 blur효과
    # high-pass filter를 이용하여 edge 검출

    # DoG를 이용해 한번에 Ix와 Iy를 구함
    DoG_x, DoG_y = get_DoG_filter(fsize, sigma=1)

    # Zero padding으로 하면 DoG에 의해 모서리 pixel 값이 주변보다 커짐
    Ix = my_filtering(src, DoG_x, 'repetition')
    Iy = my_filtering(src, DoG_y, 'repetition')

    return Ix, Iy

# Ix와 Iy의 magnitude를 구함
def calcMagnitude(Ix, Iy):
    ###########################################
    # TODO                                    #
    # calcMagnitude 완성                      #
    # magnitude : ix와 iy의 magnitude         #
    ###########################################
    # Ix와 Iy의 magnitude를 계산
    #magnitude = np.sqrt(Ix**2) + np.sqrt(Iy**2)
    magnitude = np.abs(Ix) + np.abs(Iy)
    return magnitude

# Ix와 Iy의 angle을 구함
def calcAngle(Ix, Iy):
    ###################################################
    # TODO                                            #
    # calcAngle 완성                                   #
    # angle     : ix와 iy의 angle                      #
    # e         : 0으로 나눠지는 경우가 있는 경우 방지용     #
    # np.arctan 사용하기(np.arctan2 사용하지 말기)        #
    ###################################################
    e = 1E-6
    angle = np.arctan(Iy / (Ix+e))
    return angle

# non-maximum supression 수행
def non_maximum_supression(magnitude, angle):
    mag_pad = my_padding(magnitude, (1, 1), 'zero')
    (h_pad, w_pad) = mag_pad.shape
    largest_magnitude = np.zeros(magnitude.shape, dtype=np.float32)

    for row in range(1, h_pad-1):
        for col in range(1, w_pad-1):
            angle_ = angle[row-1][col-1]

            # (degree of theta : 0~45 & 180~225)
            if (0 <= angle_ < (np.pi*0.25)):
                t = np.tan(angle_)
                # linear interpolation (m1: 정방향, m2: 역방향)
                m1 = (1-t)*mag_pad[row, col+1] + (t)*mag_pad[row+1, col+1]
                m2 = (1-t)*mag_pad[row, col-1] + (t)*mag_pad[row-1, col-1]
                if((mag_pad[row,col]<m1) | (mag_pad[row, col]<m2)):
                    # 주변 값보다 작으면 0, 그렇지 않으면 유지
                    mag_pad[row, col] = 0

            # (degree of theta : 45~90 & 225~270)
            elif ((np.pi*0.25) <= angle_ < (np.pi*0.5)):
                s = 1/np.tan(angle_)
                # linear interpolation (m1: 정방향, m2: 역방향)
                m1 = (1-s)*mag_pad[row+1, col] + (s)*mag_pad[row+1, col+1]
                m2 = (1-s)*mag_pad[row-1, col] + (s)*mag_pad[row-1, col-1]
                if ((mag_pad[row, col] < m1) | (mag_pad[row, col] < m2)):
                    # 주변 값보다 작으면 0, 그렇지 않으면 유지
                    mag_pad[row, col] = 0

            # (degree of theta : 90~135 & 270~315)
            elif(-(np.pi*0.25) <= angle_ < 0):
                t = -np.tan(angle_)
                # linear interpolation (m1: 정방향, m2: 역방향)
                m1 = (1 - t) * mag_pad[row, col + 1] + (t) * mag_pad[row - 1, col + 1]
                m2 = (1 - t) * mag_pad[row, col - 1] + (t) * mag_pad[row + 1, col - 1]
                if ((mag_pad[row, col] < m1) | (mag_pad[row, col] < m2)):
                    # 주변 값보다 작으면 0, 그렇지 않으면 유지
                    mag_pad[row, col] = 0

            # (degree of theta : 135~180 & 315~360)
            else: # -(np.pi) <= angle_ < -(np.pi*0.5)
                s = -(1/np.tan(angle_))
                # linear interpolation (m1: 정방향, m2: 역방향)
                m1 = (1 - s) * mag_pad[row - 1, col] + (s) * mag_pad[row - 1, col + 1]
                m2 = (1 - s) * mag_pad[row + 1, col] + (s) * mag_pad[row + 1, col - 1]
                if ((mag_pad[row, col] < m1) | (mag_pad[row, col] < m2)):
                    # 주변 값보다 작으면 0, 그렇지 않으면 유지
                    mag_pad[row, col] = 0

            largest_magnitude[row-1, col-1] = mag_pad[row, col]

    return largest_magnitude


# double_thresholding 수행
def double_thresholding(src):

    dst = np.zeros(src.shape, dtype=np.float32)
    dst += src

    #dst => 0 ~ 255

    dst -= dst.min()
    dst /= dst.max()
    dst *= 255
    dst = dst.astype(np.uint8)

    (h, w) = dst.shape

    # high threshold value는 내장함수(otsu방식 이용)를 사용하여 구하고
    high_threshold_value, _ = cv2.threshold(dst, 0, 255, cv2.THRESH_OTSU)
    # low threshold값은 (high threshold * 0.4)로 구한다
    low_threshold_value = high_threshold_value * 0.4

    dst_pad = my_padding(dst, (1,1), 'zero')
    (h_p, w_p) = dst_pad.shape

    weak = np.zeros((h, w))     # weak edge matrix
    for row in range(1, h_p-1):
        for col in range(1, w_p-1):
            # Strong Edge
            if (dst_pad[row, col] >= high_threshold_value):
                dst[row-1, col-1] = 255

            # None Edge
            elif (dst_pad[row, col] <= low_threshold_value):
                dst[row-1, col-1] = 0

            # Weak Edge
            else:
                # Strong edge neighbor
                if ((dst_pad[row - 1, col - 1] >= high_threshold_value) | (dst_pad[row - 1, col] >= high_threshold_value)
                        | (dst_pad[row - 1, col + 1] >= high_threshold_value) | (dst_pad[row, col - 1] >= high_threshold_value)
                        | (dst_pad[row, col + 1] >= high_threshold_value) | (dst_pad[row + 1, col - 1] >= high_threshold_value)
                        | (dst_pad[row + 1, col] >= high_threshold_value) | (dst_pad[row + 1, col + 1] >= high_threshold_value)):
                    dst[row - 1, col - 1] = 255

                # None edge neighbor
                elif ((dst_pad[row - 1, col - 1] <= low_threshold_value) & (dst_pad[row - 1, col] <= low_threshold_value)
                      & (dst_pad[row - 1, col + 1] <= low_threshold_value) & (dst_pad[row, col - 1] <= low_threshold_value)
                      & (dst_pad[row, col + 1] <= low_threshold_value) & (dst_pad[row + 1, col - 1] <= low_threshold_value)
                      & (dst_pad[row + 1, col] <= low_threshold_value) & (dst_pad[row + 1, col + 1] <= low_threshold_value)):
                    dst[row - 1, col - 1] = 0

                # weak edge
                else:
                    dst[row-1, col-1] = 100          # easy to find weak edge

    dst = hysteresis(dst)

    return dst

def hysteresis(dst):
    (h, w) = dst.shape
    # from upper_left to lower_right
    upper_left = np.zeros((h, w))
    dst_pad1 = my_padding(dst, (1,1), 'zero')
    (h_1, w_1) = dst_pad1.shape
    for row in range(1, h_1-1):
        for col in range(1, w_1-1):
            if(dst_pad1[row, col]==100):
                if((dst_pad1[row-1, col-1]==255) | (dst_pad1[row-1, col]==255) | (dst_pad1[row-1, col+1]==255)
                    | (dst_pad1[row, col-1]==255) | (dst_pad1[row, col+1]==255)
                    | (dst_pad1[row+1, col-1]==255) | (dst_pad1[row+1, col]==255) | (dst_pad1[row+1, col+1]==255)):
                    upper_left[row-1, col-1] += 255
                else:
                    upper_left[row-1, col-1] += 0

    # from lower_right to upper_left
    lower_right = np.zeros((h,w))
    dst_pad2 = my_padding(dst, (1, 1), 'zero')
    (h_2, w_2) = dst_pad2.shape
    for row in range(h_2-1, 1):
        for col in range(w_2-1, 1):
            if (dst_pad1[row, col] == 100):
                if ((dst_pad2[row - 1, col - 1] == 255) | (dst_pad2[row - 1, col] == 255) | (dst_pad2[row - 1, col + 1] == 255)
                        | (dst_pad2[row, col - 1] == 255) | (dst_pad2[row, col + 1] == 255)
                        | (dst_pad2[row + 1, col - 1] == 255) | (dst_pad2[row + 1, col] == 255) | (dst_pad2[row + 1, col + 1] == 255)):
                    lower_right[row - 1, col - 1] += 255
                else:
                    lower_right[row - 1, col - 1] += 0

    # from upper_right to lower_left
    upper_right = np.zeros((h, w))
    dst_pad3 = my_padding(dst, (1, 1), 'zero')
    (h_3, w_3) = dst_pad3.shape
    for row in range(w_3-1, 1):
        for col in range(1, h_3-1):
            if (dst_pad3[row, col] == 100):
                if ((dst_pad3[row - 1, col - 1] == 255) | (dst_pad3[row - 1, col] == 255) | (dst_pad3[row - 1, col + 1] == 255)
                        | (dst_pad3[row, col - 1] == 255) | (dst_pad3[row, col + 1] == 255)
                        | (dst_pad3[row + 1, col - 1] == 255) | (dst_pad3[row + 1, col] == 255) | (dst_pad3[row + 1, col + 1] == 255)):
                    upper_right[row - 1, col - 1] += 255
                else:
                    upper_right[row - 1, col - 1] += 0

    # from lower_left to right_upper
    lower_left = np.zeros((h, w))
    dst_pad4 = my_padding(dst, (1, 1), 'zero')
    (h_4, w_4) = dst_pad4.shape
    for row in range(1, w_4-1):
        for col in range(h_4-1, 1):
            if (dst_pad4[row, col] == 100):
                if ((dst_pad4[row - 1, col - 1] == 255) | (dst_pad4[row - 1, col] == 255) | (
                        dst_pad4[row - 1, col + 1] == 255)
                        | (dst_pad4[row, col - 1] == 255) | (dst_pad4[row, col + 1] == 255)
                        | (dst_pad4[row + 1, col - 1] == 255) | (dst_pad4[row + 1, col] == 255) | (
                                dst_pad4[row + 1, col + 1] == 255)):
                    lower_left[row - 1, col - 1] += 255
                else:
                    lower_left[row - 1, col - 1] += 0

    return (1/5)*(dst + upper_right + upper_left + lower_right + lower_left)
'''
    dst_pad2 = my_padding(dst, (1,1), 'zero')
    (h_2, w_2) = dst_pad2.shape
    for row in range(h_2-1, 1):
        for col in range(w_2-1, 1):
            if (dst[row - 1, col - 1] == 100):
                if ((dst_pad2[row - 1, col - 1] == 255) or (dst_pad2[row - 1, col] == 255)
                        or (dst_pad2[row - 1, col + 1] == 255) or (dst_pad2[row, col - 1] == 255)
                        or (dst_pad2[row, col + 1] == 255) or (dst_pad2[row + 1, col - 1] == 255)
                        or (dst_pad2[row + 1, col] == 255) or (dst_pad2[row + 1, col + 1] == 255)):
                    # change to strong edge
                    dst[row - 1, col - 1] = 255

                elif ((dst_pad2[row - 1, col - 1] == 0) and (dst_pad2[row - 1, col] == 0)
                      and (dst_pad2[row - 1, col + 1] == 0) and (dst_pad2[row, col - 1] == 0)
                      and (dst_pad2[row, col + 1] == 0) and (dst_pad2[row + 1, col - 1] == 0)
                      and (dst_pad2[row + 1, col] == 0) and (dst_pad2[row + 1, col + 1] == 0)):
                    # change to weak edge
                    dst[row - 1, col - 1] = 0

    dst_pad3 = my_padding(dst, (1, 1), 'zero')
    (h_3, w_3) = dst_pad3.shape
    for row in range(1, w_3-1):
        for col in range(1, h_3-1):
            if (dst[row - 1, col - 1] == 100):
                if ((dst_pad3[row - 1, col - 1] == 255) or (dst_pad3[row - 1, col] == 255)
                        or (dst_pad3[row - 1, col + 1] == 255) or (dst_pad3[row, col - 1] == 255)
                        or (dst_pad3[row, col + 1] == 255) or (dst_pad3[row + 1, col - 1] == 255)
                        or (dst_pad3[row + 1, col] == 255) or (dst_pad3[row + 1, col + 1] == 255)):
                    # change to strong edge
                    dst[row - 1, col - 1] = 255

                elif ((dst_pad3[row - 1, col - 1] == 0) and (dst_pad3[row - 1, col] == 0)
                      and (dst_pad3[row - 1, col + 1] == 0) and (dst_pad3[row, col - 1] == 0)
                      and (dst_pad3[row, col + 1] == 0) and (dst_pad3[row + 1, col - 1] == 0)
                      and (dst_pad3[row + 1, col] == 0) and (dst_pad3[row + 1, col + 1] == 0)):
                    # change to weak edge
                    dst[row - 1, col - 1] = 0

    dst_pad4 = my_padding(dst, (1, 1), 'zero')
    (h_4, w_4) = dst_pad4.shape
    for row in range(w_4-1, 1):
        for col in range(h_4-1, 1):
            if (dst[row - 1, col - 1] == 100):
                if ((dst_pad4[row - 1, col - 1] == 255) or (dst_pad4[row - 1, col] == 255)
                        or (dst_pad4[row - 1, col + 1] == 255) or (dst_pad4[row, col - 1] == 255)
                        or (dst_pad4[row, col + 1] == 255) or (dst_pad4[row + 1, col - 1] == 255)
                        or (dst_pad4[row + 1, col] == 255) or (dst_pad4[row + 1, col + 1] == 255)):
                    # change to strong edge
                    dst[row - 1, col - 1] = 255

                elif ((dst_pad4[row - 1, col - 1] == 0) and (dst_pad4[row - 1, col] == 0)
                      and (dst_pad4[row - 1, col + 1] == 0) and (dst_pad4[row, col - 1] == 0)
                      and (dst_pad4[row, col + 1] == 0) and (dst_pad4[row + 1, col - 1] == 0)
                      and (dst_pad4[row + 1, col] == 0) and (dst_pad4[row + 1, col + 1] == 0)):
                    # change to weak edge
                    dst[row - 1, col - 1] = 0
'''


def my_canny_edge_detection(src, fsize=3, sigma=1):
    # low-pass filter를 이용하여 blur효과
    # high-pass filter를 이용하여 edge 검출
    # gaussian filter -> sobel filter 를 이용해서 2번 filtering
    # DoG 를 사용하여 1번 filtering
    Ix, Iy = apply_lowNhigh_pass_filter(src, fsize, sigma)

    # Ix와 Iy 시각화를 위해 임시로 Ix_t와 Iy_t 만들기
    Ix_t = np.abs(Ix)
    Iy_t = np.abs(Iy)
    Ix_t = Ix_t / Ix_t.max()
    Iy_t = Iy_t / Iy_t.max()

    cv2.imshow("Ix", Ix_t)
    cv2.imshow("Iy", Iy_t)
    cv2.waitKey()
    cv2.destroyAllWindows()

    # magnitude와 angle을 구함
    magnitude = calcMagnitude(Ix, Iy)
    angle = calcAngle(Ix, Iy)

    # magnitude 시각화를 위해 임시로 magnitude_t 만들기
    magnitude_t = magnitude
    magnitude_t = magnitude_t / magnitude_t.max()
    cv2.imshow("magnitude", magnitude_t)
    cv2.waitKey()
    cv2.destroyAllWindows()

    # non-maximum suppression 수행
    largest_magnitude = non_maximum_supression(magnitude, angle)

    # magnitude 시각화를 위해 임시로 magnitude_t 만들기
    largest_magnitude_t = largest_magnitude
    largest_magnitude_t = largest_magnitude_t / largest_magnitude_t.max()
    cv2.imshow("largest_magnitude", largest_magnitude_t)
    cv2.waitKey()
    cv2.destroyAllWindows()

    # double thresholding 수행
    dst = double_thresholding(largest_magnitude)
    return dst

def main():
    src = cv2.imread('Lena.png', cv2.IMREAD_GRAYSCALE)
    dst = my_canny_edge_detection(src)
    cv2.imshow('original', src)
    cv2.imshow('my canny edge detection', dst)
    cv2.waitKey()
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()





    '''
       for row in range(h):
           for col in range(w):
               # Strong Edge
               if(dst[row, col] >= high_threshold_value):
                   dst[row, col] = 255
               # Weak Edge
               elif(dst[row, col] <= low_threshold_value):
                   dst[row, col] = 0
               # Determine strong or weak edge
               else:
                   ######################################################
                   # TODO                                               #
                   # double_thresholding 완성                            #
                   # dst     : double threshold 실행 결과 이미지           #
                   ######################################################
                   # dst[row, col] = 255
                   if ((dst_pad[row - 1, col - 1] >= high_threshold_value) or (dst_pad[row - 1, col] >= high_threshold_value)
                           or (dst_pad[row - 1, col + 1] >= high_threshold_value) or (dst_pad[row, col - 1] >= high_threshold_value)
                           or (dst_pad[row, col + 1] >= high_threshold_value) or (dst_pad[row + 1, col - 1] >= high_threshold_value)
                           or (dst_pad[row + 1, col] >= high_threshold_value) or (dst_pad[row + 1, col + 1] >= high_threshold_value)):
                       # change to strong edge
                       dst[row-1, col-1] = 255

                   elif ((dst_pad[row - 1, col - 1] < low_threshold_value) and (dst_pad[row - 1, col] < low_threshold_value)
                         and (dst_pad[row - 1, col + 1] < low_threshold_value) and (dst_pad[row, col - 1] < low_threshold_value)
                         and (dst_pad[row, col + 1] < low_threshold_value) and (dst_pad[row + 1, col - 1] < low_threshold_value)
                         and (dst_pad[row + 1, col] < low_threshold_value) and (dst_pad[row + 1, col + 1] < low_threshold_value)):
                       # change to weak edge
                       dst[row-1, col-1] = 0

                   else:  # neighbor = not strong & all not weak
                       dst[row-1, col-1] = 127
                       
        for i in range(n):
            dst = hystersis(dst)
            
            
            
            
     weak = LinkedList()
    for row in range(1, h_d - 1):
        for col in range(1, w_d - 1):
            # Strong Edge
            if (dst_pad[row, col] >= high_threshold_value):
                dst[row - 1, col - 1] = 255
                
            # None Edge
            elif (dst_pad[row, col] <= low_threshold_value):
                dst[row - 1, col - 1] = 0
                
            # Weak Edge
            else:
                # neighbor of strong edge
                if ((dst_pad[row - 1, col - 1] >= high_threshold_value) or (dst_pad[row - 1, col] >= high_threshold_value)
                        or (dst_pad[row - 1, col + 1] >= high_threshold_value) or (dst_pad[row, col - 1] >= high_threshold_value)
                        or (dst_pad[row, col + 1] >= high_threshold_value) or (dst_pad[row + 1, col - 1] >= high_threshold_value)
                        or (dst_pad[row + 1, col] >= high_threshold_value) or (dst_pad[row + 1, col + 1] >= high_threshold_value)):
                    # change to strong edge
                    dst[row - 1, col - 1] = 255
                    # stack : change to strong edge 
                    y_peek, x_peek = weak.peek()
                    if ((y_peek, x_peek) == (row - 1, col - 1) or (y_peek, x_peek) == (row - 1, col)
                            or (y_peek, x_peek) == (row - 1, col + 1) or (y_peek, x_peek) == (row, col - 1)
                            or (y_peek, x_peek) == (row, col + 1) or (y_peek, x_peek) == (row + 1, col - 1)
                            or (y_peek, x_peek) == (row + 1, col) or (y_peek, x_peek) == (row + 1, col + 1)):
                        while (not weak.isEmpty()):
                            y, x = weak.remove()
                            dst[y, x] = 255
                            
                # neighbor of none edge
                elif ((dst_pad[row - 1, col - 1] < low_threshold_value) and (dst_pad[row - 1, col] < low_threshold_value)
                      and (dst_pad[row - 1, col + 1] < low_threshold_value) and (dst_pad[row, col - 1] < low_threshold_value)
                      and (dst_pad[row, col + 1] < low_threshold_value) and (dst_pad[row + 1, col - 1] < low_threshold_value)
                      and (dst_pad[row + 1, col] < low_threshold_value) and (dst_pad[row + 1, col + 1] < low_threshold_value)):
                    # change to weak edge
                    dst[row - 1, col - 1] = 0
                    
                # neighbor weak edge
                else:  
                    y, x = weak.peek()
                    if ((low_threshold_value < dst[y - 1, x - 1] < high_threshold_value) or (low_threshold_value < dst[y - 1, x] < high_threshold_value) 
                        (low_threshold_value < dst[y - 1, x + 1] < high_threshold_value) or (low_threshold_value < dst[y, x - 1] < high_threshold_value) 
                            or (low_threshold_value < dst[y, x + 1] < high_threshold_value) or (low_threshold_value < dst[y + 1, x - 1] < high_threshold_value) 
                            or (low_threshold_value < dst[y + 1, x] < high_threshold_value) or (low_threshold_value < dst[y + 1, x + 1] < high_threshold_value)):
                        weak.add(row - 1, col - 1)
                    else:
                        dst[row - 1, col - 1] = 0
                
                # stack : none edge
                y_peek, x_peek = weak.peek()
                    if ((y_peek, x_peek) == (row - 1, col - 1) or (y_peek, x_peek) == (row - 1, col)
                            or (y_peek, x_peek) == (row - 1, col + 1) or (y_peek, x_peek) == (row, col - 1)
                            or (y_peek, x_peek) == (row, col + 1) or (y_peek, x_peek) == (row + 1, col - 1)
                            or (y_peek, x_peek) == (row + 1, col) or (y_peek, x_peek) == (row + 1, col + 1)):
                        while (weak.size() > 0):
                            y, x = weak.remove()
                            dst[y, x] = 0

       '''
import numpy as np
import cv2
import matplotlib.pyplot as plt

def my_calcHist(src):
    h, w = src.shape[:2]                                  # src is (h by w) picture

    hist = np.zeros((256,), dtype=np.int)
    for row in range(h):                                    # 누적
        for col in range(w):
            intensity = src[row, col]
            hist[intensity] += 1
    return hist


def my_normalize_hist(hist, pixel_num):
    normalized_hist = np.divide(hist, pixel_num)             # hist / pixel_num
    a = np.sum(normalized_hist)
    print(a)
    return normalized_hist


def my_PDF2CDF(pdf):
    cdf = np.cumsum(pdf)
    return cdf


def my_denormalize(normalized, gray_level):
    denormalized = np.multiply(normalized, gray_level)
    return denormalized


def my_calcHist_equalization(denormalized, hist):
    ###################################################################
    # TODO                                                            #
    # my_calcHist_equalization완성                                    #
    # denormalized : output gray_level(정수값으로 변경된 gray_level)   #
    # hist : 히스토그램                                                #
    # hist_equal : equalization된 히스토그램                           #
    ####################################################################

    hist_equal = np.zeros(len(hist), dtype=np.uint8)
    for i in range(len(hist)):
        hist_equal[denormalized[i]] += hist[i]

    return hist_equal


def my_equal_img(src, output_gray_level):

    (h, w) = src.shape[:2]
    dst = np.zeros((h, w), dtype=np.uint8)
    for row in range(h):
        for col in range(w):
            dst[row, col] = output_gray_level[src[row, col]]

    return dst

#input_image의  equalization된 histogram & image 를 return
def my_hist_equal(src):
    (h, w) = src.shape
    max_gray_level = 255
    histogram = my_calcHist(src)
    normalized_histogram = my_normalize_hist(histogram, h * w)      # PDF
    normalized_output = my_PDF2CDF(normalized_histogram)            # CDF
    denormalized_output = my_denormalize(normalized_output, max_gray_level)
    output_gray_level = denormalized_output.astype(int)             # floor operation
    hist_equal = my_calcHist_equalization(output_gray_level, histogram)

    # show mapping function
    ###################################################################
    # TODO                                                            #
    # plt.plot(???, ???)완성                                           #
    # plt.plot(y축, x축)                                               #
    ###################################################################
    plt.plot(denormalized_output, )
    plt.title('mapping function')
    plt.xlabel('input intensity')
    plt.ylabel('output intensity')
    plt.show()

    ### dst : equalization 결과 image
    dst = my_equal_img(src, output_gray_level)

    return dst, hist_equal

if __name__ == '__main__':

    src = cv2.imread('wind_speed_03.png', cv2.IMREAD_GRAYSCALE)
    #dst1 = cv2.threshold(np.array(src), 0, 255, cv2.THRESH_OTSU)
    #cv2.imwrite('./wind_thresholded.png', dst)

    h, w = src.shape
    dst = np.zeros((h, w), dtype=np.uint8)
    for row in range(h):
        for col in range(w):
            if (src[row][col] >= 100):
                dst[row][col] = 255

    cv2.imshow('src', src)
    cv2.imshow('dst', dst)
    cv2.imwrite('./wind_thresholded.png', dst)
    #hist = my_calcHist(src)
    #dst, hist_equal = my_hist_equal(src)


    # equalization before image
    #plt.figure(figsize=(8, 5))
    #cv2.imshow('original', src)
    #binX = np.arange(len(hist))
    #plt.title('my histogram')
    #plt.bar(binX, hist, width=0.5, color='g')
    #plt.show()

    # equalization after image
    #plt.figure(figsize=(8, 5))
    #cv2.imshow('equalizetion after image', dst)
    #binX = np.arange(len(hist_equal))
    #plt.title('my histogram equalization')
    #plt.bar(binX, hist_equal, width=0.5, color='g')
    #plt.show()

    cv2.waitKey()
    cv2.destroyAllWindows()


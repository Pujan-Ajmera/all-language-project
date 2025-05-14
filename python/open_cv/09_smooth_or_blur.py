import cv2 as cv
img = cv.imread('photos/best_x.png')

# blurring averaging

'''
average = cv.blur(img,(3,3))
cv.imshow('avg',average)
'''

# the (3,3) is the kernal size used in the image smoother code leetcode

# gaussian blur
'''
gauss = cv.GaussianBlur(img,(7,7),0)
cv.imshow('gauss',gauss)
'''

# median blur
'''
median = cv.medianBlur(img,3)
# 3 means (3,3)
cv.imshow('median',median)
'''

# bilateral blurring retains edges 
bilateral = cv.bilateralFilter(img,5,35,25)
cv.imshow('bilateral',bilateral)


cv.waitKey(0)
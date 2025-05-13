import cv2 as cv
import numpy as np
# countours are nearly edges 

img = cv.imread('photos/best_x.png')

gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
# cv.imshow('gray',gray)


blur = cv.GaussianBlur(gray, (5,5), cv.BORDER_DEFAULT)
cv.imshow('blur',blur)

canny = cv.Canny(blur,125,175)
# cv.imshow('canny',canny)

# can be found countours by find contour method 
contours,hierarchies = cv.findContours(canny,cv.RETR_LIST,cv.CHAIN_APPROX_SIMPLE)
print(len(contours))

img = cv.imread('photos/best_x.png')
gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
blank = np.zeros(img.shape,dtype='uint8')

ret,thresh =cv.threshold(gray,125,175,cv.THRESH_BINARY)

cv.drawContours(blank,contours,-1,(0,0,255),thickness=1)
cv.imshow('blank',blank)
# cv.RETR_LIST returns list of contours
cv.waitKey(0)
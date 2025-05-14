import cv2 as cv
import numpy as np
img =  cv.imread('photos/best_x.png')
cv.imshow('best',img)

# 2 ways to compute edges : 

gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
cv.imshow('gray',gray)

#1) laplacing
lap = cv.Laplacian(gray,cv.CV_64F)
lap = np.uint8(np.absolute(lap))
cv.imshow('laplacian',lap)

# sobel this does by both direction to calc gradients

sobelx = cv.Sobel(gray,cv.CV_64F,1,0)
sobely = cv.Sobel(gray,cv.CV_64F,0,1)
combined = cv.bitwise_or(sobelx,sobely)

cv.imshow('sobel x',sobelx)
cv.imshow('sobel y',sobely)
cv.imshow('sobel combined',combined)

canny = cv.Canny(gray,150,175)

cv.imshow('canny',canny)

cv.waitKey(0)
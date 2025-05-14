import cv2 as cv
import numpy as np

img = cv.imread('photos/THE_WEEKND.png')
blank = np.zeros(img.shape[:2],dtype='uint8')

# D:\PLAYGROUND\open_cv\photos\THE_WEEKND.png
cv.imshow('img',img)

# color channel = r,g,b

b,g,r = cv.split(img)
blue = cv.merge([b,blank,blank])
green = cv.merge([blank,g,blank])
red = cv.merge([blank,blank,r])
cv.imshow('blue',b)
cv.imshow('green',g)
cv.imshow('red',r)
 
print(img.shape)
# (1070, 1919, 3) the 3 represents the color channel 
#  other has 1 so shown as gray scale 
print(b.shape)
# (1070, 1919)
print(g.shape)
# (1070, 1919)
print(r.shape)
# (1070, 1919)

merged  = cv.merge([b,g,r])
cv.imshow('merged',merged)
cv.imshow('img',img)

# show only the respectve channels
'''
b,g,r = cv.split(img)
blue = cv.merge([b,blank,blank])
green = cv.merge([blank,g,blank])
red = cv.merge([blank,blank,r])
cv.imshow('blue',blue)
cv.imshow('green',green)
cv.imshow('red',red)
'''
cv.waitKey(0)
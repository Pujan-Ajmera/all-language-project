import cv2 as cv
import numpy as np

blank = np.zeros((400,400),dtype='uint8')

rectangle = cv.rectangle(blank.copy(),(30,30),(370,370),255,-1)
circle = cv.circle(blank.copy(),(200,200),200,255,-1)

cv.imshow('rectangle',rectangle)
cv.imshow('circle',circle)


# bitwise and gives commom element
'''
bitwise_and = cv.bitwise_and(rectangle,circle)
cv.imshow('bitwise and',bitwise_and)
'''

# bitwise or gives union/superimposeition element
'''
bitwise_or = cv.bitwise_or(rectangle,circle)
cv.imshow('bitwise or',bitwise_or)
'''

# bitwise xor gives non-common element
'''
bitwise_xor = cv.bitwise_xor(rectangle,circle)
cv.imshow('bitwise xor',bitwise_xor)
'''


# bitwise not converts the pixels from black to wjite and a white to black
'''
bitwise_not = cv.bitwise_not(rectangle)
cv.imshow('bitwise xor',bitwise_not)
'''
cv.waitKey(0)
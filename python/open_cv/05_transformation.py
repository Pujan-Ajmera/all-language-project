import cv2 as cv
import numpy as np
img = cv.imread('photos/best_x.png')

# translation
'''
def translate(img,x,y):
    transMat = np.float32([[1,0,x],[0,1,y]])
    dimensions = (img.shape[1],img.shape[0])
    return cv.warpAffine(img,transMat,dimensions)
# -x : left 
# -y : up
# +x : right
# +y : down

translated = translate(img,100,100)
cv.imshow('Translate',translated)
'''

# rotation 
'''
def rotate(img,angle,rotPoint=None):
    (height,width) = img.shape[:2]
    if rotPoint is None:
        rotPoint = (width//2,height//2)

    rotMat = cv.getRotationMatrix2D(rotPoint,angle,1.0)
    dimensions = (width,height)

    return cv.warpAffine(img,rotMat,dimensions)

rotated = rotate(img,-180)
cv.imshow('rotated',rotated)
'''

# resize again
'''
resized = cv.resize(img,(100,100),cv.INTER_CUBIC)
cv.imshow('resized',resized)
'''

# flipping
'''
flip = cv.flip(img,-1) 
cv.imshow('flipped',flip)

flip = cv.flip(img,0) 
cv.imshow('flipped',flip)

flip = cv.flip(img,1) 
cv.imshow('flipped',flip)

# 0 : vertically flip
# 1 : horizontally flip
#-1 : vertically + horizontal flip
'''


# cropping 
'''
cropped = img[200:400,600:800]
cv.imshow('cropped',cropped)
'''

cv.waitKey(0)
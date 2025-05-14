# thresholding : img to binary image
import cv2 as cv

img =  cv.imread('photos/best_x.png')
cv.imshow('best',img)

gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
cv.imshow('gray',gray)

# simple thresholding : we need to specify the value 
'''
threshould,thresh = cv.threshold(gray,225,255,cv.THRESH_BINARY)
#it looks at img and if pxl is less than 150 sets to 0 else 255(white),thresh is either 0,255
cv.imshow('simple threshold',thresh)
'''

'''
threshould,thresh_inv = cv.threshold(gray,225,255,cv.THRESH_BINARY_INV)
#it looks at img and if pxl is less than 150 sets to 255(white) else 0,thresh is either 0,255
cv.imshow('simple threshold_inv',thresh_inv)
'''

# adaptive thresholding : we need not to specify the value opencv does it for us 
adaptive_thresh = cv.adaptiveThreshold(gray,255,cv.ADAPTIVE_THRESH_GAUSSIAN_C,cv.THRESH_BINARY_INV,11,2  )
cv.imshow('adaptive thresh',adaptive_thresh)




cv.waitKey(0)
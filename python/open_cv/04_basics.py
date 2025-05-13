# basic functions in Open cv :
import cv2 as cv

img = cv.imread('photos/best_x.png')
# convert image to grayscale
'''
gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
cv.imshow('gray',gray)
'''

# blurring the image 
'''
blur = cv.GaussianBlur(gray, (3,3),cv.BORDER_DEFAULT)
cv.imshow('blur',blur)
'''

# edge cascade
'''
canny = cv.Canny(img,125,175)
cv.imshow('Canny',canny) 
# outline banave
'''

# dialating image
'''
dialated = cv.dilate(canny,(3,3),iterations=1)
cv.imshow('dialated',dialated)
'''

# eroding
'''
eroded = cv.dilate(dialated,(3,3),iterations=1)
cv.imshow('eroded',eroded)
'''


# resize by resize function imbuilt
'''
resized = cv.resize(img,(500,500))
resized = cv.resize(img,(500,500),interpolation=cv.INTER_AREA) # to make img small
resized = cv.resize(img,(500,500),interpolation=cv.INTER_LINEAR)# to make img big also can use the inter_cubic
cv.imshow('resized',resized)
'''

# cropping 
'''
cropped = img[500:1000,1000:2000]
# this is array slicing
cv.imshow('cropped',cropped)
'''

cv.waitKey(0)
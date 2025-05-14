# bit advance 
# rgb,hex etc
import cv2 as cv
import matplotlib.pyplot as plt
img = cv.imread('photos/best_x.png')


'''
plt.imshow(img)
cv.imshow('img',img)
plt.show()
'''

# matplot lib shows as a rgb only
# bgr is default for the python

# we will convert from bgr to grayscale
'''
gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
cv.imshow('gray',gray )
'''

# we will convert from bgr to hsv
'''
hsv = cv.cvtColor(img,cv.COLOR_BGR2HSV)
cv.imshow('hsv',hsv)
'''

# bgr to l*a*b
'''
lab = cv.cvtColor(img,cv.COLOR_BGR2Lab)
cv.imshow('lab',lab)
'''
# bgr to rgb
'''
rgb = cv.cvtColor(img,cv.COLOR_BGR2RGB)
cv.imshow('rgb',rgb)
'''
# there is a converse of colors see here
'''

rgb = cv.cvtColor(img,cv.COLOR_BGR2RGB)
cv.imshow('rgb',rgb)

plt.imshow(rgb)
plt.show()

'''

# hsv to bgr 

'''
hsv = cv.cvtColor(img,cv.COLOR_BGR2HSV)
hsv_bgr = cv.cvtColor(hsv,cv.COLOR_HSV2BGR)
cv.imshow('hst_to_bgr',hsv_bgr)
'''


cv.waitKey(0)
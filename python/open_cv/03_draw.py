import cv2 as cv
import numpy as np
import random
img = cv.imread('photos/best_x.png')
blank = np.zeros((500,500,3),dtype='uint8')
# uint8 is the dtype of a image
cv.imshow('x',img)
cv.imshow('blank',blank)

# we will draw on this image
blank[:] = 0,5,44
cv.imshow('random',blank)

# giving a range of pixels
blank[200:300,300:400] = 5,22,44
cv.imshow('range ',blank)


# draw a rectangle

cv.rectangle(blank,(0,0), (250,250) , (0,255,0), thickness=2)
cv.imshow('rectangle',blank)
# just border
# blank image uper rectangle banavse


cv.rectangle(blank,(0,0), (250,250) , (0,255,0), thickness=cv.FILLED)
cv.imshow('fillde rect',blank)


# drawing a circle

cv.circle(blank,(250,250) , 40, (0,0,255),thickness=3)

cv.imshow('circle',blank)


cv.circle(blank,(250,250) , 40, (0,0,255),thickness=cv.FILLED)

cv.imshow('filldd circle',blank)


# line

cv.line(blank,(0,0),(250,250),(0,65,42),thickness=2)

cv.imshow('line',blank)



# writing a text on image

cv.putText(blank,'hii pujan', (255,255), cv.FONT_HERSHEY_TRIPLEX,1.4,(0,245,56),2)

cv.imshow('text', blank)
cv.waitKey(0) #if aa nai hoi to photo nai dekhai aavai ne vayo jase









# blank[:] = random.randint(0,255),random.randint(0,255),random.randint(0,255)
# cv.imshow('random',blank)
#  this give a random colored image 
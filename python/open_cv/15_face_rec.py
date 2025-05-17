# face detection using opencvs harcascades 
# detection is the process of finding if there is a face done by classifier algo 
# face recognition is the process of finding if there are faces and of whose face are present
# it dosent depent on the colors to detect the image it just uses the edges to determine it

import cv2 as cv

img = cv.imread('photos/test.jpg')

gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
cv.imshow('gray',gray)


# this detects the no of faces 
haar_cascade = cv.CascadeClassifier('D:/PLAYGROUND/open_cv/har_facedetection.xml')
faces_rect = haar_cascade.detectMultiScale(gray,scaleFactor=1.1,minNeighbors=3)

print(f'no of faces {len(faces_rect)}')

# so this rect thing has faces coordinats from the image so we can use this coordinaes to make a rect on this face found
# the haar cascades are sensititve so even small resembelemces can be detected as a face we can make canges in the minnaibours to gert better accuracy
# this also dont work with specks wearing people or hat etc
# to make it more accurate use dilib cascades/face recognizer or somthig like that

for (x,y,w,h) in faces_rect:
    cv.rectangle(img,(x,y),(x+w,y+h),(0,255,0),thickness=2)

cv.imshow('detected face',img)




cv.waitKey(0)
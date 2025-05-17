import cv2 as cv
import numpy as np


people = ['Ben Afflek','Elton John','Jerry Seinfield','Madonna','Mindy Kaling']

haar_cascade = cv.CascadeClassifier('D:/PLAYGROUND/open_cv/har_facedetection.xml')


# features = np.load('features.npy',allow_pickle=True)
# labels =   np.load('features.npy')

faces_recognizer = cv.face.LBPHFaceRecognizer_create()
faces_recognizer.read('face_tranined.yml')

img = cv.imread(r'D:/PLAYGROUND/open_cv/val/madonna/2.jpg')

gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)
cv.imshow('person',gray)

faces_rect = haar_cascade.detectMultiScale(gray,scaleFactor=1.1,minNeighbors=4)
for (x,y,w,h) in faces_rect:
    faces_roi = gray[y:y+h,x:x+h]

    label,confidence = faces_recognizer.predict(faces_roi)
    print(f'label is = {people[label]} with a confidence of {confidence}')

    cv.putText(img,str(people[label]),(20,20),cv.FONT_HERSHEY_COMPLEX,1.0,(0,255,0),thickness=2)
    cv.rectangle(img,(x,y),(x+w,y+h), (0,255,0),thickness=2)

cv.imshow('detected face',img)
cv.waitKey(0)
# we will build a model to train on images and for that we will use the opencvs builtin recogniser 

import os
import cv2 as cv
import numpy as np

people = ['Ben Afflek','Elton John','Jerry Seinfield','Madonna','Mindy Kaling']
DIR =  r'D:/PLAYGROUND/open_cv/train'



haar_cascade = cv.CascadeClassifier('D:/PLAYGROUND/open_cv/har_facedetection.xml')

# goes to all images in each folder and add to a training set

features = []
labels = []

def create_train():
    for person in people:
        path = os.path.join(DIR,person)
        label = people.index(person)

        for img in os.listdir(path):
            img_path = os.path.join(path,img)
            
            img_array = cv.imread(img_path)
            gray = cv.cvtColor(img_array,cv.COLOR_BGR2GRAY)

            faces_rect = haar_cascade.detectMultiScale(gray,scaleFactor=1.1,minNeighbors=4)
            
            for (x,y,w,h) in faces_rect:
                faces_reg = gray[y:y+h,x:x+w]

                features.append(faces_reg)
                labels.append(label)






create_train()

features = np.array(features,dtype='object')
labels = np.array(labels)
# print(f'length of fratures = {len(features)}')
# print(f'length of labels = {len(labels)}')


faces_recognizer = cv.face.LBPHFaceRecognizer_create()

faces_recognizer.train(features,labels)

faces_recognizer.save('face_tranined.yml')#this is done so this trained model can be ised in other place as per our need

np.save('features.npy',features)
np.save('labels.npy',labels)
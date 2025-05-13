import cv2 as cv

# img = cv.imread('photos/best_x.png')
# cv.imshow('ME',img)
# cv.waitKey(0)


def rescaleFrame(frame,scale=0.75):
    # frame.shape[1] = frame ni width
    width = int(frame.shape[1] * scale)
    
    # frame.shape[0] = frame ni height
    height = int(frame.shape[0] * scale)
    
    dimensions = (width,height)

    return cv.resize(frame,dimensions,interpolation=cv.INTER_AREA)
    # resizes a frame to a given dimension

def changeRes(width,height):
# for live videos only 
    capture.set(3,width)
    capture.set(4,height)


capture = cv.VideoCapture('videos/test.mp4')
while True:
# for video, image, live video
    isTrue,frame = capture.read()
    frame_resized = rescaleFrame(frame,scale=0.5)


    cv.imshow('Video',frame)
    cv.imshow('rescaled',frame_resized)


    if cv.waitKey(20) & 0xFF == ord('d'):
        break

capture.release()
cv.destroyAllWindows()



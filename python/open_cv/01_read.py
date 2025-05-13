import cv2 as cv
# this reads image
# img = cv.imread('photos/best_x.png')
# cv.imshow('Best',img)
cv.waitKey(0)

# this reads video

capture = cv.VideoCapture('videos/test.mp4')

while True:
    isTrue,frame = capture.read()
    cv.imshow('Video',frame)

    if cv.waitKey(20) & 0xFF == ord('d'):
        break
    # if d is pressedn we stop the video playing thats it

    # so this method Capture.readis used togive two parametersthat is that is
    #

capture.release()
# breaks when all frames are over give a error as no new frames found.
#  like this error: (-215:Assertion failed)
cv.destroyAllWindows()


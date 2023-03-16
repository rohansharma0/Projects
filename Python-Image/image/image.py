import cv2

# aa = cv2.imread('a.jpg', 0)


# cv2.imshow('image', aa)

# cv2.waitKey(1000)
# cv2.destroyAllWindows()

cap = cv2.VideoCapture('a.mp4')

while(cap.isOpened()):
    ret, frame = cap.read()

    # grey = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    cv2.imshow('frame', frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()

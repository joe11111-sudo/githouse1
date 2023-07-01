import cv2
import numpy as np

img = cv2.imread("img/1.jfif")
print(img.shape)

imgResize = cv2.resize(img,(3000,200))
print(imgResize.shape)

imgCropped = img[0:200, 200:500]

cv2.imshow("Image",img)
cv2.imshow("Image Reize", imgResize)
cv2.imshow("Image Reize", imgCropped)

cv2.waitKey(0)
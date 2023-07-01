import cv2
import mediapipe as mp
import time


class poseDetector():

    def __init__(self, mode=False,upbody=False, smooth=False,
                 detectionCon=0.5, trackCon=0.5):

        self.mode =mode
        self.upBody = upbody
        self.smooth =smooth
        self.detectionCon =detectionCon
        self.trackCon =trackCon


        self.mpDraw = mp.solutions.drawing_utils
        self.mpPose = mp.solutions.pose
        self.pose = self.mpPose.Pose(self.mode, self.upBody, self.smooth, self.detectionCon, self.trackCon)

    def findPose(self, img, draw=True):

        imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        results = self.pose.process(imgRGB)
        if draw:
            if results.pose_landmark:
                self.mpDraw.draw_landmarks(img, results.pose_landmarks, self.mp.Pose.POSE_CONNECTIONS)

        return img

    def findPosition(self, img, draw=True):
        lmList = []
        if self.result.pose_landmarks:
            for id, lm in enumerate(self.results.pose_landmarks.landmark):
                h, w, c =img.shape
                #print(id, lm)
                cx, cy = int(lm.x * w),int(lm.y * h)
                lmList.append(id,cx,cy)
                if draw:
                    cv2.circle(img, (cx, cy), 5 ,(255,0,0), cv2.FILLED) #节点
        return lmList

def main():
    cap = cv2.VideoCapture('C:/Users/joejy/Downloads/1.mp4')
    pTime = 0
    detector = poseDetector()
    while True:
        success, img = cap.read()
        img = detector.findPose(img)
        lmList =detector.findPosition(img,draw= False)
        if len(lmList) != 0:
            print(lmList[14])

    cTime = time.time()
    fps = 1 / (cTime - pTime)
    pTime = cTime

    cv2.putText(img, str(int(fps)), (70, 50), cv2.FONT_HERSHEY_PLAIN, 3,
                (255, 0, 0), 3)
    cv2.imshow("Image", img)
    cv2.waitkey(1)



if __name__ == "__main__":
    main()
import SimpleOpenNI.*;
SimpleOpenNI kinect;

import processing.serial.*;
Serial port;


void setup() 
{ 
 size(640, 480);
 kinect = new SimpleOpenNI(this);
 kinect.enableDepth();
 kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
 kinect.setMirror(true);
 
 println(Serial.list());
 String portName = Serial.list()[0];
 port = new Serial(this, portName, 9600);
}


void draw() 
{
 kinect.update();
 PImage depth = kinect.depthImage();
 image(depth, 0, 0);
 IntVector userList = new IntVector();
 kinect.getUsers(userList);
 if (userList.size() > 0) {
 int userId = userList.get(0);
 if ( kinect.isTrackingSkeleton(userId)) 
 {

   drawSkeleton(1);

  PVector rightHand = new PVector();
  PVector leftHand = new PVector(); 
  PVector head = new PVector();
  PVector rightHip = new PVector();
  PVector leftHip = new PVector();
 
  
  kinect.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HAND,rightHand);
  kinect.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HAND,leftHand);
  kinect.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_HEAD,head);
  kinect.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HIP,rightHip);
  kinect.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HIP,leftHip);
  





 
 
 if(int(rightHand.y) > int(head.y ) ) // F5
{
  port.write((byte)1)  ;  
}
 
  if(int(leftHand.y) > int(head.y ) ) // ESC
{
 port.write((byte)2)  ;
}
 
 
if(int(leftHand.x) > int(rightHip.x ) ) // Next
{
 port.write((byte)3)  ; 
} 
 
 if( int(rightHand.x) < int(leftHip.x )) // Back
{
   port.write((byte)4)  ; 
} 


 else
 port.write((byte)0)  ;


 }
}
}



void drawSkeleton(int userId) 
{
 pushStyle();
 stroke(255,0,0);
 strokeWeight(3);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
 popStyle();
}





// user-tracking callbacks!
void onNewUser(int userId) {
 println("start pose detection");
 kinect.startPoseDetection("Psi", userId);
}
void onEndCalibration(int userId, boolean successful) {
 if (successful) {
 println(" User calibrated !!!");
 kinect.startTrackingSkeleton(userId);
 }
 else {
 println(" Failed to calibrate user !!!");
 kinect.startPoseDetection("Psi", userId);
 }
}
void onStartPose(String pose, int userId) {
 println("Started pose for user");
 kinect.stopPoseDetection(userId);
 kinect.requestCalibrationSkeleton(userId, true);
}




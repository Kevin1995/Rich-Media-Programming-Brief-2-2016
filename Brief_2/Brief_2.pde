import org.openkinect.*; 
import org.openkinect.processing.*;

// Kinect Library object 
Kinect kinect;

void setup() { 
  size(640, 480);
  kinect = new Kinect(this); 
  kinect.start();
  kinect.enableRGB(true); 
}

void draw(){ 
  PImage img = kinect.getVideoImage(); 
  image(img,0,0); 
}



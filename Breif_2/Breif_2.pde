import org.openkinect.processing.*;

Kinect kinect;

float deg;


void setup() {
  size(1200, 800);

  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.initVideo();
  kinect.enableColorDepth(false);
  deg = kinect.getTilt();
}


void draw() {
  background(0);

  image(kinect.getVideoImage(), 0, 0, 400, 400);
}


//with key UP or DOWM tilt the Kinect v1
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      deg++;
      deg = constrain(deg, 0, 30);
      kinect.setTilt(deg);
    } else if (keyCode == DOWN) {
      deg--;
      deg = constrain(deg, 0, 30);
      kinect.setTilt(deg);
    }
  }
  
}
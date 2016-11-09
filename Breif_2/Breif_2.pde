import processing.video.*;
import processing.sound.*;
AudioIn in;
Capture cam;

void setup() {
  size(600,400);
  cam = new Capture(this, 640, 480, 30);
  cam.start();
  
  // Create the Input stream
  in = new AudioIn(this, 0);
  in.play();
}

void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
  background(0);
  image(cam, 0, 0);
}
import processing.video.*;

Capture cam;

void setup() {
  size(600,400);
  cam = new Capture(this, 640, 480, 30);
  cam.start();
}

void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
  background(0);
  image(cam, 0, 0);
}
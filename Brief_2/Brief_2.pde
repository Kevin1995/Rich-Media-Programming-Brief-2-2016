import SimpleOpenNI.*; 
SimpleOpenNI context;

void setup(){ 
context = new SimpleOpenNI(this); 
// enable depthMap generation 
context.enableDepth(); 
// enable camera image generation
context.enableRGB(); 
background(200,0,0); 
// set the size of the canvas to the actual kinect image data
// which is actually 640x480 
size(context.depthWidth() + context.rgbWidth() + 10, context.rgbHeight()); 
}

void draw(){
// update the cam 
context.update();
// draw depthImageMap 
image(context.depthImage(),0,0);
// draw camera 
image(context.rgbImage(),context.depthWidth() + 10,0); 
}

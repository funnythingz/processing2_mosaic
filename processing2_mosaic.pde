import processing.video.*;

Capture cam;

void setup(){
  size(480, 320);
  
  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
  cam.start();
}

void captureEvent(Capture cam){
  if (cam.available() == true) {
    cam.read();
  }
}

void draw(){
  image(cam, 0, 0);
  loadPixels();
  mosaic(10, 10);
}

void mosaic(int w, int h){
  for( int y = 0; y < height; y += h ){
  for( int x = 0; x < width; x += w ){
    color c = pixels[ y * width + x ];
    fill(c);
    rect(x, y, w, h);
  }
  }
}

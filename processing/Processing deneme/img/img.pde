PImage img;

void setup() {
  size(640, 360);
  // Images must be in the "data" directory to load correctly
  img = loadImage("laDefense.jpg");
}

void draw() {
  image(img, 0, 0);
}

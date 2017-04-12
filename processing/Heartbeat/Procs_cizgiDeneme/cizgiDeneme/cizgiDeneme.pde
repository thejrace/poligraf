int val=300, ekran, old_x=0, old_y=0;

void setup() {
  size(600, 600);
  background(208,24,24);
}

void draw() {
  strokeWeight(12);
  stroke(255,255,255);
  
  line( old_x, old_y, ekran, 600-val);
  old_x = ekran;
  old_y = 600-val;
  
  ekran = ekran+5; 
  
  if(ekran>600) {
    background(208,24,24);
    ekran = -50;
    val = 100;
    old_y = 0;
    old_x = -50;
  }
}

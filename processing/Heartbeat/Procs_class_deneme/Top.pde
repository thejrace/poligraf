
class Top{  // class oldugunu soyle :D

// GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = 2;
  float speedY = 0.5;

// STRUCTRE
  Top(float _x, float _y) {
    x = _x; // _x ve _y sadece bu süslü parantezler içinde
    y = _y; // geçerli. O yuzden global variable lara atıyoruz.
  }         // boylece functions larda kullanabiliyoruz.


// FUNCTIONS
  void run() {
    display(); //gozuk
    move();    //hareket et
    bounce();  //o ye
    gravity(); // yok artık
  }
  

  
  void bounce() { //kenarlara çarpinca hareketi ters çevir. zekice!
    if(x>width || x<0 ) { speedX = speedX * -1; }
    if(y>height || y<0 ){ speedY = speedY * -1; }
  }
  
  void gravity() {
    speedY += 0.2; //her frame de aşağı doğru 0.2 ekliyor speedY ye.. zekice 
  }
  
  void move() {
    x += speedX;
    y += speedY;
  }
  
  void display() {
    ellipse(x, y, 20, 20);
  }
  
  
}


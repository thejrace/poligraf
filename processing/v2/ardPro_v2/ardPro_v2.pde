import processing.serial.*;
import cc.arduino.*;


Arduino arduino; 

color back = color(0, 0, 0); // BG renk, siyah

int sensor= 0, pot = 1;

float pDeger, pDegerMap, sDeger;
float x=0, y=0, x1=0, y1=0, artis, artis1;



void setup() {
  size(displayWidth-100, 800);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  //arduino.pinMode(sensor, Arduino.INPUT);//setup pins to be input (A0 =0?)
  //arduino.pinMode(pot, Arduino.INPUT);//setup pins to be input (A0 =0?)
   
  background(back);
}

void draw() {
 
  sDeger = arduino.analogRead(sensor);  
  print("Sensor: ");
  println (sDeger);
  
  pDeger = arduino.analogRead(pot);  
  pDegerMap = map(pDeger, 0, 1023, 0, 600);
  print("Pot Deger: ");
  println(pDegerMap);
  
  pulseHall();
  pulsePot();
}



void pulseHall() {
  strokeWeight(5);
  stroke(163, 255, 233);
  line(x, y, artis, 700-sDeger);

  x = artis;
  y = 700-sDeger;
  artis = artis + 5; 
  
  if(artis>displayWidth-100) {  
    background(back);
    artis = -50;
    x = -50;
    y = 0;
  }
  
}

void pulsePot() {
  strokeWeight(5);
  stroke(255, 252, 34);
  line(x1, y1, artis1, 1000-pDegerMap);
  
  x1 = artis1;
  y1 = 1000-pDegerMap;
  artis1 = artis1 + 5;
  
  if(artis1>displayWidth-100){
    artis1 = -50;
    x1 = -50;
    y = 0;
  }
}

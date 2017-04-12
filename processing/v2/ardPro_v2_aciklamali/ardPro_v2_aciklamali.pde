import processing.serial.*;
import cc.arduino.*;


Arduino arduino; // Arduino object tanımladık.

color back = color(0, 0, 0); // BG renk, siyah

int sensor= 0, pot = 1;
int sDeger, pDeger;
int x=0, y=0, artis;



void setup() {
  size(displayWidth-100, 600);
  arduino = new Arduino(this, Arduino.list()[0], 57600); // Arduino portunu tanımladık.
  //arduino.pinMode(sensor, Arduino.INPUT);//setup pins to be input (A0 =0?)
  //arduino.pinMode(pot, Arduino.INPUT);//setup pins to be input (A0 =0?)
   
  background(back);
}

void draw() {
 
  sDeger = arduino.analogRead(sensor);  // A0 daki sensörü oku.
  print("Sensor: ");
  println (sDeger);
  
  pDeger = arduino.analogRead(pot);   //A1 deki sensörü oku
  print("Pot Deger: ");
  println(pDeger);
  
  pulse();
}

  //Arduino' dan aldığım analog değerleri, görselleştiren fonksiyon.

void pulse() {
  strokeWeight(5);
  stroke(163, 255, 233);
  line(x, y, artis, 600-sDeger);
  
  // cizgiyi ilk cizmeye basladiginda program çizgiyi "x" ten, "artis" a çizecek.
  // daha sonra "artis" 5 artacak. yani a iken a+5 oldu. 
  // devamli çizgi çizmek istedigimiz için;
  // "a+5" ten "a+5+5" (artis) e kadar tekrar çizgi çizmemiz lazım.
  // o yüzden her seferinde çizginin bitiş noktasını, başlangıç noktasına eşitliyoruz.
  // böylece devamlı bir çizim elde ediyoruz.
  x = artis;
  y = 600-sDeger;
  
  artis = artis + 5; // bu artış miktarı da böylece çizginin hızı olmuş oluyor.
  
  // bu koşulda çizgi ekranı aştığında, çizginin başlangıç noktalarını güncellemek için
  // x ve artis'i -50 yaptim çünkü, ekrana direk düz çizgi olarak girsin.
  // y = 0, bunda bir problem yok. Saçmalamayı x ekseninde yapiyor.
  
  if(artis>displayWidth-100) {  
    background(back);
    artis = -50;
    x = -50;
    y = 0;
  }
  
}

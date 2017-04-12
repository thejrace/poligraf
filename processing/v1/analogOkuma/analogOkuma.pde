import processing.serial.*;

Serial myPort;
int sensorDeger, ekran, old_x=100, old_y=0;
String inString;
String durum;
int lf = 10; 
PFont f;
void setup() {
  size(displayWidth-100, 600);
  
  String portName = Serial.list()[0];
 // println(Serial.list());
  
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil(lf);
  background(0,0,0); // blood red
  
  f = createFont("Trebuchet MS", 24);
  textFont(f);
}

void draw() {}

void serialEvent(Serial myPort) {  // Serial porttan her data gelişinde çalışacak callBack
  inString = myPort.readString();  // Gelen datayı oku, inString' e yazdır
  inString = trim(inString);       // Rakam olmayan dataları kırp, ( örn. line feed )
  sensorDeger = int(inString);     // stringi, rakama (int) çevir
  strokeWeight(5);                // çizginin kalınlığı
  stroke(163,255,233);             // çizgiyi beyaz yap
  
  text("Sensör Deger", 200, 200);
  println(sensorDeger);
  text("Nefes: ", 300, 100);
  if(sensorDeger<= 200) {
  text("ALDI", 800, 100);
  } 
  
  if(sensorDeger<=270 && sensorDeger>=220) {
    text("ALMA/VERME", 550, 100);

  }
  
  if(sensorDeger>271) {
    text("VERDI",400, 100);

  }
  
  line(old_x, old_y, ekran, 600-sensorDeger);  
  old_x = ekran;
  old_y = 600-sensorDeger;
  
  ekran = ekran+2;
  
  // simdi cizgiyi devamli olarak yenilenecek hale getirmemiz lazim
  // çizgiyi bir noktadan diğerine kordinat vererek çiziyoruz
  // o yüzden çizgi ekranı aştığında, başlangıç ve bitiş noktalarını yenilememiz gerekiyor
  // old_x ve old_y, başlangıç x ve y' leri, başlangıçta 0 olarak belirlemiştik. 
  
 if(ekran>(displayWidth-100)){
   background(0, 0, 0);
   ekran = -50;
   old_x = -50;
   old_y = 0;
  }
  
}




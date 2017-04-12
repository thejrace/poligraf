  import processing.serial.*;
  import cc.arduino.*; 
   
  Arduino arduino; 
  //Timer t;
  
  PFont f;
  PImage aldi, verdi, alma, soltexture, solukBaslik, solukBaslikTexture;
  PImage ustKenar, solKenar, altKenar, sagKenar, clear, clearText;

  float x=80, y=80, artis;
  int sensor=0;
  int yazmac = 0;
  //int solukSayisi = 0;
  
  float sDeger, sDegerMapped;
  
  color beyaz = color(255,255,255);
  color siyah = color(0,0,0);
  color kirmizi = color(208,24,24);
  
  int time;
  int solukTime;
  int dkSoluk;
  
  
  void setup() {
  background(siyah);
  size(800, 600);
  smooth();

  arduino = new Arduino(this, Arduino.list()[0], 57600);
 //t = new Timer( 500, 100);
  aldi = loadImage("img/aldi_ico.png");
  verdi = loadImage("img/verdi_ico.png");
  alma = loadImage("img/alma_ico.png");
  soltexture = loadImage("img/soltexture.png");
  solukBaslik = loadImage("img/solukBaslik.png");
  solukBaslikTexture = loadImage("img/solukBaslikTexture.png");
  ustKenar = loadImage("img/ustKenar.png");
  solKenar = loadImage("img/solKenarBuyuk.png");
  altKenar = loadImage("img/altKenar.png");
  sagKenar = loadImage("img/sagKenar.png");
  clear = loadImage("img/clear.png");
  clearText = loadImage("img/clearText.png");
  f = createFont("Trebuchet MS", 18);
  textFont(f);
  
  
  }

  void draw() {
    
   // t.saat();
    
    
    cerceve();
    infoSablon();
    sensorGrafik();
    
    sensorOkuYaz();
    
    if(sDegerMapped<-12) { //ALDI
      image(clearText, 100, 310);
      fill(48, 224, 231);
      text("ALDI", 100, 340);
      //yazmac = 1;
      //solukSayisi++;
      //image(clearText, 200, 460);
      //fill(48, 224, 231);
      //text(solukSayisi, 200, 460);
      //sayacDongu();
      gecenSureHesapla();
      
      
      
    }
    
    if(sDegerMapped >= -11 && sDegerMapped <= 96) {
      image(clearText, 100, 310);
      fill(48, 224, 231);
      text("ALMA/VERME", 100, 340);
      yazmac = 1;
      saatKaydet();
      
      
    } 
    
    if(sDegerMapped > 96) {
      image(clearText, 100, 310);
      fill(48, 224, 231);
      text("VERDI", 100, 340);
      
    }
    
  }
/*
  void sayacDongu() {
    sensorOkuYaz();
    delay(1);
    sensorGrafik();
    
    if(sDegerMapped >= -11 && sDegerMapped <= 96) {
      yazmac = 0;
    }
    
   if(sDegerMapped > 96) {
      yazmac = 0;
   }
   
   if(yazmac == 1) {
     solukSayisi = solukSayisi;
     image(clearText, 100, 460);
     fill(48, 224, 231);
     text(solukSayisi, 200, 460);
     sayacDongu();
   }
 }
 */
   
  void saatKaydet() {
    time = millis() / 1000; 
    if (yazmac == 1) {
      time = time;
    } else { yazmac = 0; }
    println(time);
  } 
   
      
  void gecenSureHesapla () {
    solukTime = (millis() / 1000) - time ; 
    println("Saniye :" + solukTime);
    
    dkSoluk = 60 / (solukTime);
    image(clearText, 300, 390);
    text(dkSoluk, 300, 420);
  } 
  
   
  void sensorGrafik() {

    strokeWeight(1);
    stroke(111, 194, 255);
    line(x, y, artis, 175-sDegerMapped);
    x = artis;
    y = 175-sDegerMapped;
    artis = artis + 5;
  
    if(artis==480) {
      //background(siyah);
      image(clear, 80,42); // temizle
      artis = 80;
      x = 80;
      y = 100;
    }
    

  }

  void cerceve() {
    image(soltexture, 40,40); // yazilari smooth yapmak için
    image(solukBaslik, 180, 260);
    image(solukBaslikTexture, 180,260);
    image(ustKenar, 30,28); // ustKenar = 12x464px
    image(solKenar, 0,39); //solKenar = 11x202px // soldaki paraziti sildim
    image(altKenar, 30,240); //altKenar = 12x464px
    image(sagKenar, 479,39); //sagKenar = 11x202px
    strokeWeight(1);
    stroke(142,142,142);
    line(40, 40 ,480, 40); //ust
    line(40, 40, 40, 240); // sol
    line(40, 240, 480 ,240); //alt
    line(480, 40, 480, 240); //sag 
    
    strokeWeight(1); //dik
    stroke(beyaz);
    line(80, 50, 80, 230);
    
    strokeWeight(1); //yatay alt
    stroke(beyaz);
    line(50, 190, 470, 190);
    
    strokeWeight(1); //yatay ust
    stroke(beyaz);
    line(50, 90, 470, 90);
    
    image(verdi, 50, 47);
    image(alma, 50, 97);
    image(aldi, 50, 200);
    
  }
  
  void infoSablon() {
    fill(beyaz);
    text("Soluk: ", 50,340);
    text("Soluk Durum : ", 50,380);
    text("Dakikadaki Soluk : ", 50,420);
    text("Soluk Sayisi: ", 50, 460);
    
  }
  
  void sensorOkuYaz () {
    sDeger = arduino.analogRead(sensor);
    sDegerMapped = map(sDeger, 320, 528, 0, 100);
    //print("Sensor: ");
    //println(sDegerMapped);
  }
  

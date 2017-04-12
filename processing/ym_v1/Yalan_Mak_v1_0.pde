//import processing.serial.*;
//import cc.arduino.*; 
   
//Arduino arduino; 
  
color siyah = color(0,0,0);
color grafGri = color(142,142,142);
color beyaz = color(255, 255, 255);
color koyuGri = color(55,55,55);
color solukAyrac = color(56, 91, 116);
color nabizAyrac = color(129, 54, 54);
color direncAyrac = color(122, 110, 66);
PImage solukUst, solukAlt, solukSag, solukSol, info_baslik, info_soluk, info_soluk_durum, info_soluk_dk;
PImage nabizUst, nabizAlt, nabizSag, nabizSol, info_nabiz_olcum, info_nabiz_durum;
PImage direncUst, direncAlt, direncSag, direncSol, info_direnc, info_direnc_deger;
PImage header, sensor_kontrol_header, sensor_soluk_ok, sensor_soluk_no, sensor_nabiz_ok, sensor_nabiz_no, sensor_direnc_ok, sensor_direnc_no, sensor_ok_no_temizle;
PImage clear_yatay, clear_dik;

int sensor1, sensor2, sensor3;
int s1=0, s2=1, s3=2;
float nSensor, dSensor, sSensor, map_nSensor, map_dSensor, map_sSensor;
float x1=95, y1=164, artis1, x2=95, y2=344, artis2, x3=95, y3=574, artis3;

void setup() {
  size(1400, 900);
  background(siyah);
  
  //arduino = new Arduino(this, Arduino.list()[0], 57600);
  //println(Arduino.list()[0]);
  //arduino.pinMode(s1, Arduino.INPUT);
  //arduino.pinMode(s2, Arduino.INPUT);
  //arduino.pinMode(s3, Arduino.INPUT);
  
  header = loadImage("img/header.png");
  
  solukUst = loadImage("img/solukGraf/ustGlow.png");
  solukAlt = loadImage("img/solukGraf/altGlow.png");
  solukSag = loadImage("img/solukGraf/sagGlow.png");
  solukSol = loadImage("img/solukGraf/solGlow.png");
  info_soluk = loadImage("img/solukGraf/info_soluk.png");
  info_soluk_durum = loadImage("img/solukGraf/info_soluk_durum.png");
  info_soluk_dk = loadImage("img/solukGraf/info_soluk_dk.png");
  info_baslik = loadImage("img/info_baslik.png");
  sensor_kontrol_header = loadImage("img/sensor_kontrol_header.png");
  sensor_direnc_ok = loadImage("img/sensor_direnc_ok.png");
  sensor_direnc_no = loadImage("img/sensor_direnc_no.png");
  sensor_nabiz_ok = loadImage("img/sensor_nabiz_ok.png");
  sensor_nabiz_no = loadImage("img/sensor_nabiz_no.png");
  sensor_soluk_ok = loadImage("img/sensor_soluk_ok.png");
  sensor_soluk_no = loadImage("img/sensor_soluk_no.png");
  sensor_ok_no_temizle = loadImage("img/sensor_ok_no_temizle.png");
  clear_dik = loadImage("img/clear_dik.png");
  clear_yatay = loadImage("img/clear_yatay.png");
  
  nabizUst = loadImage("img/nabizGraf/ustGlow.png");
  nabizAlt = loadImage("img/nabizGraf/altGlow.png");
  nabizSag = loadImage("img/nabizGraf/sagGlow.png");
  nabizSol = loadImage("img/nabizGraf/solGlow.png");
  info_nabiz_durum = loadImage("img/nabizGraf/info_nabiz_durum.png");
  info_nabiz_olcum = loadImage("img/nabizGraf/info_nabiz_olcum.png");
  
  direncUst = loadImage("img/direncGraf/ustGlow.png");
  direncAlt = loadImage("img/direncGraf/altGlow.png");
  direncSag = loadImage("img/direncGraf/sagGlow.png");
  direncSol = loadImage("img/direncGraf/solGlow.png");
  info_direnc = loadImage("img/direncGraf/info_direnc.png");
  info_direnc_deger = loadImage("img/direncGraf/info_direnc_deger.png");
  
  
}


void draw() {

  header_grafik_ciz();
  grafik_cerceve_ciz();
  sensor_deger_oku();
  sensor_kontrol ();
  sensor_to_grafik();
  
  
}

void sensor_deger_oku() {  // Analog inputları oku, parçala, console' a yazdır.
 
  
  sSensor = arduino.analogRead(s1);
  map_sSensor = map(sSensor, 0, 1023, 0, 100);
  //print("sSensor Deger: ");
  //println(map_sSensor);
  
  /*if( map_sSensor != 1 && map_sSensor !=2 ) { 
    image(sensor_ok_no_temizle, 6, 45);
    image(sensor_soluk_ok, 6, 45);
  } else {
    image(sensor_ok_no_temizle, 6, 45);
    image(sensor_soluk_no, 6, 45);
  }*/
    
  nSensor = arduino.analogRead(s2);
  map_nSensor = map(nSensor, 0, 1023, 0, 100);
  //print("nSensor Deger: ");
  //println(map_nSensor);
  
 /* if( map_nSensor != 1 && map_nSensor !=2 ) { 
    sensor2 = 1;
  }*/
  
  dSensor = arduino.analogRead(s3);
  map_dSensor = map(dSensor, 0, 1023, 0, 100);
  //print("dSensor Deger: ");
  //println(map_dSensor);
  
  /*if( map_dSensor != 1 && map_dSensor !=2 ) { 
    sensor3 = 1;
  }*/
  
}

void grafik_cerceve_ciz() {
  
  strokeWeight(1);
  stroke(grafGri);
  line(80, 114, 1310, 114);   //  solukUst
  image(solukUst, 80, 100);   //  solukUst Glow
  line(80, 114, 80, 344);     //  solukSol
  image(solukSol, 69, 126);   //  solukSol Glow
  line(80, 344, 1310, 344);   //  solukAlt
  image(solukAlt, 81, 345);   //  solukAlt Glow
  line(1310, 114, 1310, 344); //  solukSag
  image(solukSag, 1311, 126); //  solukSag Glow   
  
  line(80, 384, 1310, 384);   // nabizUst
  image(nabizUst, 80, 370);   // nabizUst Glow
  line(80, 384, 80, 614);     // nabizSol
  image(nabizSol, 69, 396);   // nabizSol Glow
  line(80, 614, 1310, 614);   // nabizAlt
  image(nabizAlt, 80, 615);   // nabizAlt Glow
  line(1310, 384, 1310, 614); // nabizSag
  image(nabizSag, 1311, 396); // nabizSag Glow
  
  line(80, 654, 1310, 654);   // direncUst
  image(direncUst, 80, 640);  // direncUst Glow
  line(80, 654, 80, 884);     // direncSol
  image(direncSol, 69, 666);  // direncSol Glow
  line(80, 884, 1310, 884);   // direncAlt
  image(direncAlt, 80, 885);  // direncAlt Glow
  line(1310, 654, 1310, 884); // direncSag 
  image(direncSag, 1311, 666);// direncSag Glow
  
  strokeWeight(1);
  stroke(beyaz);
  line(120, 134, 120, 324);  // soluk y koordinat cizgisi | height:190px, margin-left/right:20px, margin-top/bottom:20px
  line(95, 164, 959, 164 );  // soluk x koordinat cizgisi üst | width:864px, margin-top/bottom:30px
  line(95, 294, 959, 294);   // soluk x koordinat cizgisi alt | width:864px, margin-top/bottom:30px
  
  line(120, 404, 120, 594);  // nabiz y koordinat cizgisi | height:190px, margin-left/right:20px, margin-top/bottom:20px
  line(95, 564, 959, 564 );  // nabiz x koordinat cizgisi | width:864px, margin-bottom:30px;
  
  line(120, 674, 120, 864);  // direnc y koordinat cizgisi | height:190px, margin-left/right:20px, margin-top/bottom:20px
  line(95, 834, 959, 834);  // direnc x koordinat cizgisi | height:864px, margin-bottom:30px;
  
  stroke(grafGri);
  fill(siyah);
  // rect(969, 120, 335, 220);  // soluk info container
  // rect(969, 390, 335, 220);  // nabiz info container
  // rect(969, 660, 335, 220);  // direnc info container
 
  
  /************** INFO GRAF AYRAÇ **************/
  stroke(solukAyrac);
  line(1000, 130, 1000, 330); 
  stroke(nabizAyrac);
  line(1000, 400, 1000, 600);
  stroke(direncAyrac);
  line(1000, 670, 1000, 870);

  
  image(info_baslik, 1130, 150);
  image(info_soluk, 1109, 199);  // (x + 89)
  image(info_soluk_durum, 1053, 225); // (x + 33)
  image(info_soluk_dk, 1020, 251);
  
  image(info_baslik, 1130, 426); // +270
  image(info_nabiz_durum, 1030, 475); 
  image(info_nabiz_olcum, 1032, 501); // (x+2)
  
  image(info_baslik, 1130, 702);
  image(info_direnc, 1042, 751); // (x + 12)
  image(info_direnc_deger, 1030, 777);
 
  
}

void header_grafik_ciz() {
    
  image(header, 0, 0);
  fill(koyuGri);
  stroke(grafGri);
  rect(-1, 25, 90, 13);
  image(sensor_kontrol_header, 6, 27);
  
}


void sensor_kontrol () {
  sensor1 = 1; // soluk
  sensor2 = 0; // nabiz
  sensor3 = 1; // direnc
  
  if ( sensor1 == 1 ) { 
    image(sensor_ok_no_temizle, 6, 45);
    image(sensor_soluk_ok, 6, 45);
  } else {
    image(sensor_ok_no_temizle, 6, 45);
    image(sensor_soluk_no, 6, 45);
  }
  
  if ( sensor2 == 1 ) { 
    image(sensor_ok_no_temizle, 6, 65);
    image(sensor_nabiz_ok, 6, 65);
  } else {
    image(sensor_ok_no_temizle, 6, 65);
    image(sensor_nabiz_no, 6, 65);
  }
  
  if ( sensor3 == 1 ) { 
    image(sensor_ok_no_temizle, 6, 85);
    image(sensor_direnc_ok, 6, 85);
  } else {
    image(sensor_ok_no_temizle, 6, 85);
    image(sensor_direnc_no, 6, 85);
  }
  
}

void sensor_to_grafik() {
  /*****SOLUK SENSOR*******/
  
  strokeWeight(2);
  stroke(0, 195, 203);
  line(x1, y1, artis1, 275-map_sSensor);
  
  image(clear_dik, 83, 116);  // sol tarafta kalanlari temizle
  x1 = artis1;
  y1 = 275-map_sSensor;
  artis1 = artis1 + 5;

  if( artis1 > 964 ) {
    image(clear_yatay, 0, 100); // önceki grafiği temizle
    artis1 = 95;
    x1 = 95;
    y1 = 164;
  }
  
  /*****##SOLUK SENSOR*******/
  
  /*****NABIZ SENSOR*******/
  
  strokeWeight(2);
  stroke(215, 44, 44);
  line(x2, y2, artis2, 550-map_nSensor);
  
  image(clear_dik, 83, 385);  // sol tarafta kalanlari temizle
  x2 = artis2;
  y2 = 550-map_nSensor;
  artis2 = artis2 + 5;

  if( artis2 > 964 ) {
    image(clear_yatay, 0, 350); // önceki grafiği temizle
    artis2 = 95;
    x2 = 95;
    y2 = 344;
  }
  
  /*****##NABIZ SENSOR*******/  
  
  /*****DİRENÇ SENSOR*******/
  
  strokeWeight(2);
  stroke(227, 175, 0);
  line(x3, y3, artis3, 810-map_dSensor);
  
  image(clear_dik, 83, 655);  // sol tarafta kalanlari temizle
  x3 = artis3;
  y3 = 810-map_dSensor;
  artis3 = artis3 + 5;

  if( artis3 > 964 ) {
    image(clear_yatay, 0, 610); // önceki grafiği temizle
    artis3 = 95;
    x3 = 95;
    y3 = 574;
  }
  
  /*****##DİRENÇ SENSOR*******/ 
  
  
}



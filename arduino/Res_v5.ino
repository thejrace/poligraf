//#include <SimpleTimer.h>
#include <glcd.h>
#include <fonts/allFonts.h>
#include "bitmaps/allBitmaps.h"


//SimpleTimer t; // Timer' ı tanımladık.

int hallSensor = A0;  // A0' daki Hall Effect Sensörü (UGN5303)
int solukSayisi = 0;
int yazmac = 0;
int sensorDeger;
int solukSayisiDk;
String durum;
String solukDurum;
int sayacStart;
int sayacStop;
int solukSure;
int solukDk;
int sayacYazmac = 0;

void setup() {
  // LCD_Intro();   //Uskudar logo, Yalan Makinesi Animasyonlari
  LCD_Sabit();      //LCD' deki sabit yazilar. (Nefes, Soluk Sayisi, Sensor Deger)
  Serial.begin(9600);
  // t.setInterval(60000, solukOrtalama); // Dakikada bir solukOrtalama() çalıştır.
}

void loop() {
  // t.run(); // Timer'ı başlat.
  sensorOkuYaz();    // Sensör degerini oku.
  solukSayisiYaz();  // Soluk sayisini yazdir.
  
  if (sensorDeger >= 521) {
    durum = ("Durdu          ");
    durumYazdir();
  }
  
  if (sensorDeger >= 515 && sensorDeger <= 520) {      // Sensör değeri koşulu sağlıyorsa; Nefes:Verdi.
    durum = ("Verdi          ");
    durumYazdir();
    sayacHesapla();
  }

  if (sensorDeger <= 514 && sensorDeger >=336) {  // Sensör değeri koşulu sağlıyorsa; Nefes:Alma/Verme.
    durum = ("Alma/Verme");
    durumYazdir();
    sayacStart = millis()/1000;
    sayacYazmac = 1;
    sayacBasla();
  }

  if (sensorDeger <= 335) {  // Sensör değeri koşulu sağlıyorsa; Nefes:Aldı.
    solukSayisi++;           // Soluk sayısını 1 arttır.
    yazmac = 1;              // Yazmacı 1 yap.
    durum = ("Aldi            ");    
    durumYazdir();
    solukSayisiYaz();        // Soluk sayısını güncelle.
      
    Dongu();                 // Nefes:Aldı olduğu sürece SolukSayısının artmaması için Dongu' ye dallan.
  }
  
}

void sayacBasla() {
  sensorOkuYaz();
  
  if (sensorDeger >= 521) {
    sayacYazmac = 0;
  }
  
  if (sensorDeger >= 515 && sensorDeger <= 520) { // Verdi
    sayacYazmac = 0; 
  }
  
  if (sensorDeger <= 335) {
    sayacYazmac = 0;
  }
  
  if (sayacYazmac==1) {          
    sayacStart = sayacStart; 
    Serial.print("sayacStart: ");
    Serial.println(sayacStart);
    sayacBasla();             
  }
}

void sayacHesapla() {
  
  solukSure = ( millis() / 1000 ) - sayacStart;
  Serial.print("solukSure: ");
  Serial.println(solukSure);
  solukDk = 60 / solukSure;
  Serial.print("solukDk: ");
  Serial.println(solukDk);
  
}

void LCD_Intro() {        // //Uskudar logo, Yalan Makinesi Animasyonlari
  GLCD.Init(NON_INVERTED);
  GLCD.ClearScreen();
  delay(1000);
  GLCD.DrawBitmap(uskudarv2_64x64, 5, 0, BLACK);
  GLCD.GotoXY(83, 15);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print("Y");
  delay(200);
  GLCD.print("A");
  delay(200);
  GLCD.print("L");
  delay(200);
  GLCD.print("A");
  delay(200);
  GLCD.print("N");
  delay(200);
  GLCD.GotoXY(75, 30);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print("M");
  delay(200);
  GLCD.print("A");
  delay(200);
  GLCD.print("K");
  delay(200);
  GLCD.print("I");
  delay(200);
  GLCD.print("N");
  delay(200);
  GLCD.print("E");
  delay(200);
  GLCD.print("S");
  delay(200);
  GLCD.print("I");
  delay(200);
  GLCD.GotoXY(82, 45);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print("v.1.0");
  delay(2000);
  GLCD.ClearScreen();
}

void LCD_Sabit() {  //LCD' deki sabit yazilar. (Nefes, Soluk Sayisi, Sensor Deger)
  GLCD.Init(NON_INVERTED);
  GLCD.ClearScreen();
  delay(1000);
  GLCD.GotoXY(0, 0);
  GLCD.SelectFont(Arial14);
  GLCD.print("Nefes:");
  GLCD.GotoXY(10, 55);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print("Sensor Deger:");
  GLCD.GotoXY(0, 20);
  GLCD.SelectFont(SystemFont5x7);
  //GLCD.print("Soluk Sayisi:");
  GLCD.print("Dk. Soluk No:");
  GLCD.GotoXY(0, 35);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print("Nefes Durum:");
}

void sensorOkuYaz() {  // hallEffect sensörü oku ve LCD' ye yazdır.
  sensorDeger = analogRead(hallSensor);
  GLCD.GotoXY(95, 55);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(sensorDeger);
}

void solukSayisiYaz() {  // Soluk sayısını LCD' ye yazdır.
  GLCD.GotoXY(80, 20);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(solukSayisi);
  GLCD.print("  ");
}

void durumYazdir() {    // Nefes:.... durum Stringini LCD' ye yazdır.
  GLCD.GotoXY(40, 0);
  GLCD.SelectFont(Arial_bold_14);
  GLCD.GotoXY(40, 0);
  GLCD.SelectFont(Arial_bold_14);
  GLCD.print(durum);
}

void Dongu() {    // Durum:Aldı olduğunda; SolukSayısını devamlı arttırmamak için programın dallandığı etiket.
  sensorOkuYaz();  // Sensörü tekrar okuyup LCD' ye yazdır.
  
  if (sensorDeger >= 521) {
    yazmac = 0;
  }
  
  if (sensorDeger >= 515 && sensorDeger <= 520) { // Verdi
    yazmac = 0;  // Yazmac=0 oldu ve program loop' a devam etti.
  }
  
  if (sensorDeger <= 514 && sensorDeger >= 336) {  // Alma / Verme
    yazmac = 0;  // Yazmac=0 oldu ve program loop' a devam etti.
  }
  
  if (yazmac==1) {              // Durum:Aldı oldu, program Dongu()'ye dallandığında Yazmac=1 olarak dallandı.
    solukSayisi = solukSayisi;  // solukSayısı da 1 arttı. Burada Yazmac hala 1 ise 
    solukSayisiYaz();           // solukSayisi artmayı durdursun diyorum ve Dongu() etiketinde kalsın.
    Dongu();                    // Eğer Dongu()' den çıkarsa, solukSayisi artmaya devam eder. Çünkü yukarıda 
                                // void loop' ta her okumada solukSayisi bir artacak.
  }

}

void solukOrtalama() {
  solukSayisiDk = solukSayisi;
  if (solukSayisiDk > 45) {
    solukDurum = "Yuksek   ";  
    solukDurumYaz();    
  }

  if(solukSayisiDk <= 40) {
    solukDurum = "Normal  ";  
    solukDurumYaz();            
  }
        
  solukSayisi = 0;
}

void solukDurumYaz() {
  GLCD.GotoXY(72, 35);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(solukDurum);
}

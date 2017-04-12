#include <glcd.h>
#include <fonts/allFonts.h>
#include "bitmaps/allBitmaps.h"

int hallSensor = A0;  // A0' daki Hall Effect Sensörü (UGN5303)
int solukSayisi = 0;
int yazmac = 0;
int sensorDeger;
String durum;

void setup() {
  LCD_Intro();   //Uskudar logo, Yalan Makinesi Animasyonlari
  LCD_Sabit();      //LCD' deki sabit yazilar. (Nefes, Soluk Sayisi, Sensor Deger)
}

void loop() {
  sensorOkuYaz();    // Sensör degerini oku.
  solukSayisiYaz();  // Soluk sayisini yazdir.
  
  if (sensorDeger >= 515) {      // Sensör değeri koşulu sağlıyorsa; Nefes:Verdi.
    durum = ("Verdi          ");
    durumYazdir();
  }

  if (sensorDeger <= 514 && sensorDeger >=336) {  // Sensör değeri koşulu sağlıyorsa; Nefes:Alma/Verme.
    durum = ("Alma/Verme");
    durumYazdir();
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
  GLCD.GotoXY(0, 10);
  GLCD.SelectFont(Arial14);
  GLCD.print("Nefes:");
  GLCD.GotoXY(10, 55);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print("Sensor Deger:");
  GLCD.GotoXY(0, 30);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print("Soluk Sayisi:");
}

void sensorOkuYaz() {  // hallEffect sensörü oku ve LCD' ye yazdır.
  sensorDeger = analogRead(hallSensor);
  GLCD.GotoXY(95, 55);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(sensorDeger);
}

void solukSayisiYaz() {  // Soluk sayısını LCD' ye yazdır.
  GLCD.GotoXY(80, 30);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(solukSayisi);
}

void durumYazdir() {    // Nefes:.... durum Stringini LCD' ye yazdır.
  GLCD.GotoXY(40, 10);
  GLCD.SelectFont(Arial_bold_14);
  GLCD.GotoXY(40, 10);
  GLCD.SelectFont(Arial_bold_14);
  GLCD.print(durum);
}

void Dongu() {    // Durum:Aldı olduğunda; SolukSayısını devamlı arttırmamak için programın dallandığı etiket.
  sensorOkuYaz();  // Sensörü tekrar okuyup LCD' ye yazdır.
  
  if (sensorDeger >= 515) { // Verdi
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

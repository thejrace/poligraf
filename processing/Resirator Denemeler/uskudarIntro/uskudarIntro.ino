#include <glcd.h>
#include <fonts/allFonts.h>  
#include "bitmaps/allBitmaps.h"
int hall = A0;
int durum=0;
  
void setup () {
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

void loop() {
  int hallRead = analogRead(hall);
  float hallDuzgun = hallRead * ( 10.0 / 520.0 );
  GLCD.GotoXY(95, 55);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(hallDuzgun); 
  
  switch(durum)
  {
    case 1:
    GLCD.GotoXY(40, 10);
    GLCD.SelectFont(Arial_bold_14);
    GLCD.GotoXY(40, 10);
    GLCD.SelectFont(Arial_bold_14);
    GLCD.print("Verdi          "); 
    break;
    case 2:
    GLCD.GotoXY(40, 10);
    GLCD.SelectFont(Arial_bold_14);
    //GLCD.print("            ");
    GLCD.GotoXY(40, 10);
    GLCD.SelectFont(Arial_bold_14);
    GLCD.print("Alma/Verme");
    break;
    case 3:
    GLCD.GotoXY(40, 10);
    GLCD.SelectFont(Arial_bold_14);
    //GLCD.print("            ");
    GLCD.GotoXY(40, 10);
    GLCD.SelectFont(Arial_bold_14);
    GLCD.print("Aldi           ");
    say();
    break;
    default:
    GLCD.GotoXY(40, 10);
    GLCD.SelectFont(Arial_bold_14);
    GLCD.print("Sabit");
  }
  
  if ( hallRead >= 515 ) {
    durum = 1;
  }
  
  if ( hallRead <= 514 && hallRead >= 336 ) {
    durum = 2;
  }
  
  if ( hallRead <=335 ) {
    durum=3;
  }
  
}

  
void say() {   
  int sayi=0;
  sayi++;
  GLCD.GotoXY(80, 30);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(sayi);  
} 

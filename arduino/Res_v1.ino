#include <glcd.h>
#include <fonts/allFonts.h>

int hall = A0;
int durum = 0; // D1=durma, D2=aliyor, D3=aldi, D4=veriyor, D5=verdi
int soluksayisi = 0;
void setup() {
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

void loop () {
  int hallRead = analogRead(hall);
  GLCD.GotoXY(95, 55);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(hallRead);
 
  GLCD.GotoXY(80, 30);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(soluksayisi); 

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
    soluksayisi++;
   
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




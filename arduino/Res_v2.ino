#include <glcd.h>
#include <fonts/allFonts.h>

int hall = A0;
int durum = 0; // D1=durma, D2=aliyor, D3=aldi, D4=veriyor, D5=verdi
int soluksayisi = 0;
int hallRead;
int yazmac = 0;
String yazi;
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
  SensorOku();
  GLCD.GotoXY(95, 55);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(hallRead);
 
  GLCD.GotoXY(80, 30);
  GLCD.SelectFont(SystemFont5x7);
  GLCD.print(soluksayisi); 

    
   
 
  
  if ( hallRead >= 515 ) {
    yazi = ("Verdi          ");
    EkranYazdir();
    yazmac = 0;  // yazmacı sıfırladık.
  }
  
  if ( hallRead <= 514 && hallRead >= 336 ) {
    yazi = "Alma Verme";
    EkranYazdir();
    yazmac = 0;    // yazmacı sıfırladık.
  }
  
  if ( hallRead <=335 ) {
    soluksayisi++;;    // soluksayisini arttır.
    yazmac = 1;       // yazmac 1 oldu.
    GLCD.GotoXY(80, 30);             //
    GLCD.SelectFont(SystemFont5x7);  // Ekrana yazdır.
    GLCD.print(soluksayisi);         //
 
    Dongu(); // Tekrar soluksayisini arttirmamasi icin, Dongu() ' ye git!
  }
  
  
  
  
  
  
}

void Dongu()
  {
    SensorOku(); // Once sensoru oku
    GLCD.GotoXY(95, 55);                //
    GLCD.SelectFont(SystemFont5x7);     // Sensör degerini yazdir.
    GLCD.print(hallRead);               //
  
    if ( hallRead >= 515 ) {            // Eger kosul saglaniyorsa, yazmac 0 olsun, loop' a devam et.
      yazmac = 0;                       // yazmac==1 if' ine girme.
    }
  
    if ( hallRead <= 514 && hallRead >= 336 ) {  // Eger kosul saglaniyorsa, yazmac 0 olsun, loop' a devam et.
      yazmac = 0;                                // yazmac==1 if' ine girme.
  }
  
    if (yazmac == 1 ){            // Eger yukaridaki kosullar saglanmadiysa, yani yazmac= 1 ise;
      soluksayisi = soluksayisi;  // soluksayisini arttirma.
      yazi = "Aldi            ";        // 
      EkranYazdir();              // Ekrana yazdir.
  
      Dongu();                    // Döngüde kal.
    }
}

void EkranYazdir(){
GLCD.GotoXY(40, 10);
    GLCD.SelectFont(Arial_bold_14);
    //GLCD.print("            ");
    GLCD.GotoXY(40, 10);
    GLCD.SelectFont(Arial_bold_14);
    GLCD.print(yazi);
}

void SensorOku()
  {
  hallRead = analogRead(hall);
  }



int sensor = A0;
int degerler[3];
int toplam;
int ort;
void setup () {
  Serial.begin(9600);
}

void loop() {
  for (int i = 0; i<3; i++) {
    degerler[i] = analogRead(sensor);
    delay(50);
  }
  toplam = degerler[0] + degerler[1] + degerler[2];
  ort = toplam / 3;
 

 Serial.print("   Ilk deger: ");
  Serial.println(degerler[0]);
 delay(333);
 Serial.print("   Ikinci deger: ");
  Serial.println(degerler[1]);
 delay(33);
 Serial.print("   Ucuncu deger: ");
  Serial.println(degerler[2]);
 delay(333);
 Serial.print("Ortalama= ");
 Serial.println(ort);
 delay(1000);
}

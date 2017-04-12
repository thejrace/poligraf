int degerler[3];
int zaman, toplam, ort, ortNefes;
int sensor=A0, deger;
void setup() {
  Serial.begin(9600);
}

void loop() {
  //zaman = millis() / 1000;
 // Serial.println(zaman);
 
 sensorOku();
 if (deger > 500) {
   aldi();
 }
  
}

void hesaplaYaz () {
 // toplam = degerler[0] + degerler[1] + degerler[2];
  //ort = toplam / 3;
  //ortNefes = 60 / ort;
  
}

void sensorOku() {
  deger = analogRead(sensor);
  Serial.print("Sensor deger: ");
  Serial.println(deger);
}

void aldi() {
  sensorOku();
  zaman = millis() / 1000;
  Serial.print("Zaman= ");
  Serial.println(zaman);
  if (deger < 300) {
    verdi();
  }
  aldi();
}

void verdi() {
  sensorOku();
  for (int i = 0; i<3; i++) {
    zaman = degerler[i];
    delay(5);
    
  }
  Serial.print("Deger1: ");
  Serial.println(degerler[0]);
  
}

int sensor = A0;
int deger;
int mapped;

void setup() {
  Serial.begin(9600);  
}

void loop() {
 deger = analogRead(sensor);
 mapped = map(deger, 0, 1023, 0, 600);
 Serial.println(mapped);
 delay(5);
}

Top topik;  // Top classının elemanı "topik" olduğunu söyledik. Önce söyle sonra yap!

void setup() {
  size(600, 600);
  smooth(); // kenarları yumusattı, AA gibi
  
  topik = new Top(200,200); // topik'i Top classının elemanı yaptık.

}

void draw() {
  background(0,0,0); // her loop ta temzilenmiş oluyor, vay amk!
  topik.run();
}

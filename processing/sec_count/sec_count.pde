/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/25849*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int sec=0;

void setup(){
  size(320,600);
  smooth();
}

void draw(){
  background(0);

  sec=second();
  for(int lop=0;lop<5;lop++){
    if(sec>10)sec=second()-(10*lop);

  }


  ////seconds////
  if(sec==1){
    rect(240,80,48,160);
    rect(240,288,48,160);
  }
  if(sec==2){
    rect(80,32,160,48);
    rect(80,240,160,48);
    rect(32,288,48,160);
    rect(80,448,160,48);
    rect(240,80,48,160);
  }
  if(sec==3){
    rect(80,32,160,48);
    rect(80,240,160,48);
    rect(80,448,160,48);
    rect(240,80,48,160);
    rect(240,288,48,160);
  }
  if(sec==4){
    rect(32,80,48,160);
    rect(80,240,160,48);
    rect(240,80,48,160);
    rect(240,288,48,160);
  }
  if(sec==5){
    rect(80,32,160,48);
    rect(32,80,48,160);
    rect(80,240,160,48);
    rect(80,448,160,48);
    rect(240,288,48,160);
  }

  if(sec==6){
    rect(80,32,160,48);
    rect(32,80,48,160);
    rect(80,240,160,48);
    rect(32,288,48,160);
    rect(80,448,160,48);
    rect(240,288,48,160);
  }
  if(sec==7){
    rect(80,32,160,48);
    rect(240,80,48,160);
    rect(240,288,48,160);
  }
  if(sec==8){
    rect(80,32,160,48);
    rect(32,80,48,160);
    rect(80,240,160,48);
    rect(32,288,48,160);
    rect(80,448,160,48);
    rect(240,80,48,160);
    rect(240,288,48,160);
  }
  if(sec==9){
    rect(80,32,160,48);
    rect(32,80,48,160);
    rect(80,240,160,48);
    rect(80,448,160,48);
    rect(240,80,48,160);
    rect(240,288,48,160);
  }
  if(sec==10){
    rect(80,32,160,48);
    rect(32,80,48,160);
    rect(32,288,48,160);
    rect(80,448,160,48);
    rect(240,80,48,160);
    rect(240,288,48,160);
  }


}





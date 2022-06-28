//how to stamp an image
//how to change thickness of stamp tool

//colour pallette
color darkBlue    = #264653;
color turquoise   = #2A9D8F;
color yellow      = #E9C46A;
color orange      = #F4A261;
color red         = #E76F51;
color brown       = #B28146;
color blue        = #8ecae6;
color black       = #03071e;
color peach       = #FCE3CF;
color white       = #FFFFFF;
//varable for selective color
color selectiveColor;
//variable for slider
float sliderX;
float thickness;
//variable for stamp
PImage pickle;
boolean pickleOn;
PImage sushi; 
boolean sushiOn;
float a;

void setup(){
  size(900,600);
  strokeWeight(5);
 sliderX= 465;
 pickle = loadImage("pickle.png"); 
  pickleOn= false;
  sushi = loadImage("sushi.png");
  sushiOn= false;
  a= 200;
   background(peach);
   selectiveColor= peach;
   thickness= 0;
}
//============end 



void draw() {
 
//toolbar
  strokeWeight(1);
  stroke(darkBlue);
  fill(darkBlue);
  rect(0,0,900, 100);
   
//turquoise button
  strokeWeight(3);
  tactile(50,50,25,turquoise);
  fill(turquoise);
  circle (50,50,50);
  
//yellow button
  tactile(115,50,25, yellow);
  fill(yellow);
  circle(115, 50, 50);
  
//orange button
  tactile(180,50,25, orange);
  fill(orange);
  circle(180, 50, 50);
 
//red button
 tactile(245,50,25, red);
 fill(red);
 circle(245, 50, 50);
 
//brown button
 tactile(310,50,25, brown);
 fill(brown);
 circle(310, 50, 50);
 
//black button
 tactile(375,50,25, black);
 fill(black);
 circle(375, 50, 50);
 
//indicator 
  stroke(peach);
  fill(peach);
  circle(555, 50, 50);
  fill(selectiveColor);
  circle(555, 50, thickness);

//clear button
 tactile(800, 30, 80, 40, peach); 
 fill(peach);
 rect(800, 30, 80, 40);
 
//slider
 stroke(peach);
 //strokeWeight(5);
 fill(peach);
  thickness= map(sliderX, 415,515,0, 50); 
 //strokeWeight(thickness);
 line(415, 50, 515, 50);
circle(sliderX, 50, 20); //put slider function here 
  

//stamp tool
   strokeWeight(3);
   fill(peach);
  tactile(700,15,70,70, peach);
 pickleOnOff ();
  rect(700, 15, 70, 70);
  image(pickle, 705, 20, 60, 60);

 //sushi
  strokeWeight(3);
  fill(peach);
 tactile(600,15,70,70,peach);
 sushiOnOff();
  rect(600, 15, 70, 70);
  image(sushi, 600, 15, 70, 70);
  
  
}//============end


//mouse dragged sushi stamp
void mouseDragged() {
  
  controlSlider();
  if (sushiOn == true ) {
    image(sushi, mouseX, mouseY, thickness * 10, thickness * 10);
  } else if (pickleOn == true){  
   image(pickle, mouseX, mouseY, thickness * 10, thickness * 10);
  } else {
    strokeWeight(thickness);
    stroke(selectiveColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  
}
  


void mouseReleased() {
 controlSlider();
  //color buttons
   if (dist(50, 50, mouseX, mouseY) <25) {
     selectiveColor= turquoise; 
   }
   
   if (dist(115, 50, mouseX, mouseY) <25) {
     selectiveColor= yellow; 
   }
   
   if (dist(180, 50, mouseX, mouseY) <25) {
     selectiveColor= orange; 
   }
   if (dist(245, 50, mouseX, mouseY) <25) {
     selectiveColor= red; 
   }
    if (dist(310, 50, mouseX, mouseY) <25) {
     selectiveColor= brown; 
   }
   if (dist(375, 50, mouseX, mouseY) <25) {
     selectiveColor= black; 
   }
   
  //sushi tactile
  
  if (mouseX> 600 && mouseX < 670 && mouseY > 15 && mouseY < 85) {
    sushiOn = !sushiOn;
  }
  if(mouseX> 700 && mouseX <770 && mouseY> 15 && mouseY< 85){
    pickleOn= !pickleOn;
  }
  //new button
  if (mouseX> 800 && mouseX< 880 && mouseY> 30 && mouseY < 70){
    stroke(peach); 
    fill(peach);
    rect(0,101,900,600);
  }
}


//tactile color buttons
void tactile(int x, int y, int r, color i) {
  if(dist (x, y, mouseX, mouseY) <r) {
    stroke(white);
  } else { 
    stroke (i);
  }
}

//tactile clear button
void tactile(int x, int y, int w, int h, color i) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
  stroke(black);
  fill(a);
  } else { 
    stroke(i);
  }
}// ===========end 


void sushiOnOff () {
  if (sushiOn == true) {
    stroke( black);
    strokeWeight(3);
  } else {
    stroke(peach);
    strokeWeight(1);
  }
}

void pickleOnOff () {
  if (pickleOn == true) {
    stroke(black);
    strokeWeight(3);
  } else {
    stroke (peach);
    strokeWeight(1);
  }
}

void controlSlider() {
//slider
  if (mouseX> 415 && mouseX< 515 && mouseY> 25 && mouseY< 75) {
    sliderX= mouseX;
  }  
}

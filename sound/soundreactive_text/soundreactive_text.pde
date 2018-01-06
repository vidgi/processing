import ddf.minim.*;
 
 
float myOpacity;
//float getVolume;
PFont font;
float extvalue;
Minim minim;
AudioPlayer player;
float bufferSizeMy;
int i = 0; 
float x;
float y;
 
void setup() {
  font = createFont("Georgia", 12);
textAlign(CENTER);
  textFont(font, 25);
smooth();
  size(1200, 800);
  background(0); 
 
  minim = new Minim(this); //INITIALISE MINIM LIBRARY
 
 
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("Bird Singing Sound Effect - Free Sound Effects.mp3");
 
  // play the file from start to finish.
  // if you want to play the file again,
  // you need to call rewind() first.
  player.play();
    player.loop();

 
  bufferSizeMy = player.bufferSize() - 1;
}
 
void draw() {
  background(0); 
 
  // I replaced the for-loop with a loop that uses the 
  // looping of draw() itself. 
  // Disavantage: pretty fast; advantage: pretty accurate.
  // Alternatively: use for but with myOpacity = map ( abs(player.mix.get(i)), 0, 100, 0, 255);
  // 100 instead of .7 because then they got printed all over one another. 
  // Alternatively: or use for-loop but only till 10 and not i < player.bufferSize() - 1
 
  // for (int i = 0; i < player.bufferSize() - 1; i++) {
  // player.mix.get(i)
  myOpacity = map ( abs(player.mix.get(i)), 0, .7, 0, 255);
  // myOpacity = 255;  
  extvalue=(20*myOpacity)+100;
  println ( abs(player.mix.get(i)) 
    + " -> "
    + myOpacity
    + " -> "
    + extvalue); 


  fill(255, 255, 255, extvalue);
  text("RESURRECT", width/2, height/2);
 //text("FRANCISCO X. ALARCÓN", (width/2), 300);
  
 //text("words are birds", width/2, 200);
// text("FRANCISCO X. ALARCÓN", (width/2), 300);
  
  //text("words", (width/2)+x, 200+y);
  //text("are birds", (width/2)+x, 300+y);
  //text("that arrive", (width/2)+x, 400+y);
  //text("with books", (width/2)+x, 500+y);
  //text("and spring", (width/2)+x, 600+y);
 //rotateY(y*10);
 //rotateX(x*10);
  textSize(40+(myOpacity/4));

  // }
  if (i < player.bufferSize() - 1) 
  {
    i++;
   x = (random(-5, 5))/10;
   y = (random(-5, 5))/10;
  }
  else
  {
    i=0;
    bufferSizeMy = player.bufferSize() - 1;
  }
}
//
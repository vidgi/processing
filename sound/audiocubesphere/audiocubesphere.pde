import ddf.minim.*;
 
Minim minim;
AudioInput in;
AudioInput sound;

//set the buffer for the sound input:
//this is how many samples are taken per frame
int buffer = 1024;

//array to hold the multiplied amplitude of samples
float[] rad = new float[buffer];
// Size of cubes
float bounds = 200;
float bounds2 = 500;

float angle1;
 
void setup() {
      fullScreen(P3D);

  //size(800, 800, P3D);  
  smooth();
    minim = new Minim(this);
  in = minim.getLineIn();
  sound = minim.getLineIn(Minim.STEREO, buffer);

}


 
void draw() {
  background(0);
  
  
 // camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
 lights();
 // directionalLight(0, 255, 0, 0, -1, 0);

//  for(int i = 0; i < in.bufferSize() - 1; i++)
//{
//    beginShape();
//    line( i, 200 + in.left.get(i)*500, i+1, 200 + in.left.get(i+1)*500 );
//    endShape(); 
//}



//the sound samples are between 0.0-1.0
//multiplier will amplify this to 0.0- the value of multiplier;
int multiplier = 600;
int initrad = 300;
for(int i = 0; i < sound.mix.size() - 1; i++){
//store the new multiplied values in an array
rad[i] = sound.mix.get(i) * multiplier + initrad;
}

//get the step of the angle count to make one full revolution
float angstep = 360.00/buffer;
float angcount = 0;

fill(255);
noStroke();

for(int i = 0; i < rad.length - 1; i++){

//get first x and y coordinate for the position of a small circle
float xpos = width/2 + rad[i] * cos(radians(angcount));
float ypos = height/2 + rad[i] * sin(radians(angcount));
ellipse(xpos,ypos,2,2);
angcount = angcount + angstep;
}



 int numPoints = int(map(mouseX, 0, width, 0, 800));
  float angle = 0;

  float angleStep = numPoints*4;
  
  // Center in display window
  translate(width/2, height/2, -130);
 
  // Rotate cube
  noFill();
  //fill(255);
    for (int i = 0; i <= numPoints; i++) {
    
    bounds = numPoints;
    bounds2 = 2*numPoints;
    angle1=angleStep/1000;
  }

  rotateY(angle1);
  stroke(255);
 
 float c = map(mouseX, 0, width, 0, 255);
  // Scale the mouseX value from 0 to 640 to a range between 40 and 300
 // stroke(100,20,c);
stroke(255);
 strokeWeight(1);

 // strokeWeight(c/20);
  strokeJoin(ROUND);

  
for(int i = 0; i < in.bufferSize() - 1; i++)
{
    box(300+200*in.left.get(i));
}

  // Transparent cube, just using box() method 
 
 box(bounds);

//box(bounds2);
 sphere(bounds-300);


}
 
//
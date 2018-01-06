import ddf.minim.*;

Minim minim;
AudioInput sound;

//set the buffer for the sound input:
//this is how many samples are taken per frame
int buffer = 1024;

//array to hold the multiplied amplitude of samples
float[] rad = new float[buffer];

void setup() {
size(800,800,P3D);

minim = new Minim(this);
sound = minim.getLineIn(Minim.STEREO, buffer);
}

void draw(){
background(0);

//the sound samples are between 0.0-1.0
//multiplier will amplify this to 0.0- the value of multiplier;
int multiplier = 600;
int initrad = 100;
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
}
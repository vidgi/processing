
import ddf.minim.*;
 
Minim minim;
AudioInput in;
 
int reactLast;
int reactBetween = 100;
float soundIntensity = 1;
 
ArrayList <Circle> circles = new ArrayList <Circle> ();
 
void setup() {
  size(600, 600);
  strokeWeight(3);
  smooth();
  noFill();
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 64);
}
 
void draw() {
  background(0);
  
  float sound = 0;  
  for (int i=0; i<in.bufferSize()-1; i++) {
    sound += in.left.get(i);
  }
  if (abs(sound)>soundIntensity&&millis()-reactLast>reactBetween) {
    reactLast = millis();
 circles.add( new Circle( new PVector(width/2,height/2),255));
  }
  
  for (int i=circles.size()-1; i>=0; i--) {
    Circle c = circles.get(i);
    c.run();
  }
}
 
class Circle {
  PVector pos;
  color c;
  int age;
  
  Circle(PVector _pos, color _c) {
    pos = _pos;
    c = _c;
  }
  
  void run() {
    stroke(c, max(0, 255-age*0.25));
    ellipse(pos.x, pos.y, age*1.5, age*1.5);
    age += 3;
    if (age>600) { 
      circles.remove(this);
    }
  }
}
 
void stop() {
  in.close();
  minim.stop();
  super.stop();
}
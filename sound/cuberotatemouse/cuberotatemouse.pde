// Size of cubes
float bounds = 200;
float bounds2 = 500;

float angle1;
 
void setup() {
  size(800, 800, P3D);  
  smooth();
}
 
void draw() {
  background(0);
 // camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
 lights();
 // directionalLight(0, 255, 0, 0, -1, 0);

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

  
  // Transparent cube, just using box() method 
 
  box(bounds);
 // box(bounds);

  box(bounds2);
  sphere(bounds-300);


}
 
//
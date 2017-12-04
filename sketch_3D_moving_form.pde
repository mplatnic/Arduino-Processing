/*
Moving forms exercise
Michel Platnic -2017
*/

float xoff = 0.0;

void setup() {
  size(640, 480,P3D);
}

void draw() {
  background(204);
  xoff = xoff + .01;
  float n = noise(xoff);
  
  // Drawing lines in 3D requires P3D
  // as a parameter to size()
  translate(width*0.5,height*0.2,0);
  rotate(n*3);
  scale(2);
  
  stroke(20,(1-n)*200,60);
  line(30, 20, 0, 85, 20, 15);
  line(85, 20, 15, 85, 75, 0);
  stroke(n*255,(1-n)*200,255);
  line(85, 75, 0, 30, 75, -50);
}
/*
Moving forms exercise with serial communication
Michel Platnic -2017
*/


import processing.serial.*; //import the Serial library
Serial myPort;  // The serial port, this is a new instance of the Serial class (an Object)
float serialInput = 0.0;
float xoff = 0.0;

void setup() {
  size(640, 480,P3D);

  // List all the available serial ports
  printArray(Serial.list());
  // change the number below to match your port:
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

}

void draw() {
  background(44);
  xoff = xoff + .01;
  float n = noise(xoff);
  
  // Drawing lines in 3D requires P3D
  // as a parameter to size()
  translate(width*0.5,height*0.2,0);
  rotate(n*3);
  scale(serialInput/200);
  //scale(2);
  stroke(20,(1-n)*200,60);
  line(30, 20, 0, 185, 20, 15);
  line(185, 20, 15, 185, 175, 0);
  stroke(n*255,(1-n)*200,255);
  line(185, 175, 0, 30, 175, -50);
  // Point light on the right rotating
  pointLight(250, 100, 0, // Color
             200, -150, 0); // Position
               
  // Blue directional light from the left rotating
  directionalLight(255, 102, 255, // Color
                   1, 1, 0); // The x-, y-, z-axis direction
 

  fill(45,157,230);
  rotate((1-n)*2.5+serialInput/250+0.1);
  box(50,90,60);
  noStroke();
}

void serialEvent (Serial myPort) {
  // get the byte:
  serialInput = myPort.read();
  // print it:
  println(serialInput/50);
}
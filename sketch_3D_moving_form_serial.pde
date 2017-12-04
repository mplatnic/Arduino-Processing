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
  scale(serialInput/100);
  //scale(2);
  stroke(20,(1-n)*200,60);
  line(30, 20, 0, 85, 20, 15);
  line(85, 20, 15, 85, 75, 0);
  stroke(n*255,(1-n)*200,255);
  line(85, 75, 0, 30, 75, -50);
  noFill();
  rotate((1-n)*3);
  box(50,30,60);
  noStroke();
}

void serialEvent (Serial myPort) {
  // get the byte:
  serialInput = myPort.read();
  // print it:
  println(serialInput/50);
}
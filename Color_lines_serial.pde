/* 
Continuous line creations
first created by RedFrik
With Serial communication
Michel Platnic - 2007
*/

import processing.serial.*; //import the Serial library
Serial myPort;  // The serial port, this is a new instance of the Serial class (an Object)
float serialInput = 0.0;
int i= 0;

void setup() {
  frameRate(60); //faster frame updaterate
  size(1040, 880, P2D); //using P2D renderer for nicer lines
 // smooth(4); //some antialiasing
  background(0);
  
  // List all the available serial ports
  printArray(Serial.list());
  // change the number below to match your port:
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

}
void draw() {
  //version 1 gray
  //version 2 colorful 
  //stroke(50,(70+i)%255,(200+i*0.5)%255); 
  //version 3 colorful sine wave
  stroke(sin(i*0.03)*127.5+127.5,cos(i*0.02)*127.5+127.5,60);
  rotate(serialInput/100);
  line( //arguments can be written on separate lines - easier to read
    sin(i*0.029)*width*0.5+(width*0.5), //start x
    sin(i*0.04)*height*0.5+(height*0.5), //start y
    sin(i*0.03)*width*0.5+(width*0.5), //stop x
    sin(i*0.012+0.3)*height*0.5+(height*0.5) //stop y
  );
  i++;
}

void serialEvent (Serial myPort) {
  // get the byte:
  serialInput = myPort.read();
  // print it:
  println(serialInput/50);
}
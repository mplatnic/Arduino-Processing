/* 
This Processing sketch is a basic visualisation program
for serial data.
Based on: https://itp.nyu.edu/physcomp/labs/labs-serial-communication/serial-output-from-an-arduino/
*/


import processing.serial.*;
Serial myPort;
float xPos = 0; // horizontal position of the graph
float yPos = 0; // vertical position of the graph

void setup () {
  size(800, 600);        // window size
  background(40,10,40);
  // List all the available serial ports
  printArray(Serial.list());

  // change the number below to match your port:
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw () {
   // draw the line:
  stroke(50,200,120);
  line(xPos, height, xPos, yPos);
  // at the edge of the screen, go back to the beginning:
  if (xPos >= width) {
    xPos = 0;
    // clear the screen by resetting the background:
    background(20);
  } else {
    // increment the horizontal position for the next reading:
    xPos++;
  }
}

void serialEvent (Serial myPort) {
  // get the byte:
  int inByte = myPort.read();
  // print it:
  println(inByte);
  yPos = height - inByte;
}
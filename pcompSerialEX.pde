//draw first triangle row- fill(r1, g1, b1);
//draw secon triangle row- fill(r2, g2, b2);
//color is different originally following the diameter. 
// get Sensor Value -> if poten==left {change 1st row's color}
// if poten == right {change 2nd row's color}

import processing.serial.*;

Serial myPort;

boolean turnRed;
float tAlpha;

TriangleFirst [] t1= new TriangleFirst[1000];
TriangleSecond [] t2= new TriangleSecond[1000];

void setup() {

  size(600, 600);
  println(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);  

  myPort.bufferUntil('\n');

  turnRed = false;
  tAlpha = 0;

  for (int i=0; i<width; i++) {
    for (int j = 0; j <height; j++) {
      t1[i] = new TriangleFirst();
      t2[i] = new TriangleSecond();
    }
  }
}

void draw() {
  background(255);

  for (int i=0; i<width; i++) {
    for (int j = 0; j <height; j++) {
      if (turnRed==true) {
        t1[i].display(i*30, j*30, i*13+80, j*10);
      }
      else {

        t2[i].display(i*30, j*30, i*13+80, j*10);
      }
    }
  }
}


void serialEvent (Serial myPort) {

  String myString = myPort.readStringUntil('\n'); 
  
  print(turnRed+" // "+ myString);   
   myString = trim(myString);
   
   int sensors[] = int(split(myString, '\n'));

  for (int sensorNum = 0; sensorNum <sensors.length; sensorNum++) {
   
    if (0<= sensors[0] && sensors[0]<= 255/2) {
   turnRed = true;
   
   }else{
   turnRed = false;
   
   }
  }
}

class TriangleFirst {


  float x;
  float y;
  float s;

  TriangleFirst() {
    x=0;
    y=0;
    s= 30;
  }

  void display(float fx, float fy, float fr, float fa) {

    fill(fr, 0, 0,fa); 
    noStroke();
    triangle(fx, fy, fx+s, fy, fx, fy+s);
  }
}


class TriangleSecond {


  float x;
  float y;
  float s;

  float r;
  float g;
  float b;
  float a; 


  TriangleSecond() {
    x=0;
    y=0;
    s=30;
 
  }

  void display(float fx, float fy, float fr, float fa) {

    r= 204-(fr*1.43);    
    b= 156+(fr*0.28);
    g= 61+(fr*0.92);  

    fill(r, g, b, fa); 
    noStroke();
    triangle(fx+s, fy+s, fx+s, fy, fx, fy+s);
  }
}



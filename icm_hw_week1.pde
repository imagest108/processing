
void setup(){
  size(400,400);
  
}

void draw(){
  background(255);
  
  //center coordinate
  
  int cx=90;
  int cy=200;
  
  //draw triangles to make a hexagon shape
  noStroke();
  
  fill(100,100,100);
  triangle(50,170,180,120,cx,cy);
  fill(255,0,50); 
  triangle(180,120,240,108,cx,cy);
  triangle(240,108,350,135,cx,cy);
  triangle(350,135,230,289,cx,cy);
  triangle(230,289,130,270,cx,cy);
  triangle(130,270,50,170,cx,cy);
  
  //draw lines
  stroke(255);
  strokeWeight(2);
  line(50,170,cx,cy);
  line(180,120,cx,cy);
  line(240,108,cx,cy);
  line(350,135,cx,cy);
  line(230,289,cx,cy);
  line(130,270,cx,cy);
  
  //draw circles
  ellipseMode(CENTER);
  fill(255);
  ellipse(50,170,30,30);
  ellipse(180,120,10,10);
  ellipse(240,108,50,50);
  ellipse(350,135,40,40);
  ellipse(230,289,18,18);
  ellipse(130,270,35,35);
  
}

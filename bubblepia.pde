
int currentTotal = 5;
int numBubbles = 500;
int bubbleid;
Bubble[] bubbles = new Bubble[numBubbles];

boolean colorChange = true;





void setup() {
  size(800, 560); 


  for (int i=0; i<numBubbles; i++) {
   
    bubbles[i] = new Bubble(random(width), height, random(20, 100), i, bubbles);
   
  }

  frameRate(30);
  colorChange = !colorChange;
  //id = 0;
}





void draw() {
  background(255);
  stroke(255);
  


  for (int i=0; i<currentTotal; i++) {

    if (colorChange) { 
      bubbles[i].display(1);
      bubbles[i].collide();
    }
    else {
      bubbles[i].display(2);
      bubbles[i].collide();
      
        }
  }
  
  if(random(1)<0.5){
    currentTotal++;
    if (currentTotal >= bubbles.length) {
      currentTotal = bubbles.length-1; 
    }
  }  
  
    
}

void mousePressed() {

  setup();
  
}



class Bubble {

  float x;
  float y;
  float d;
  float speed;
  int id;

  float cFact1;
  float cFact2;
  float cFact3;

  Bubble[] others;

  boolean collision;

  Bubble(float bx, float by, float bd, int bid, Bubble[] otherbs) { 
    
    constrain(x, 0+d, width-d);
    constrain(y, 0+d, height-d);
    x= bx;
    y= by;
    d= bd;
    speed= d*0.042;
    id = bid;
    others = otherbs;
    collision = false;
  }

  void display(int bubbleColor) {

 
    
    
    if (bubbleColor == 1) {
      cFact3= 204-(id*1.43);
      cFact2= 156+(id*0.28);
      cFact1= 61+(id*0.92);
    }
    else if (bubbleColor ==2) {
      cFact1= 204-(id*1.43);
      cFact2= 156+(id*0.28);
      cFact3= 61+(id*0.92);
    }

    y = y-speed;
    x = x+random(-2, 2);
    fill(cFact1, cFact2, cFact3, 70); 
    ellipseMode(CENTER);
    ellipse(x, y, d, d);
    noStroke();
    fill(255, 50);
    ellipse(x-5, y-1, 2*d/3, d*87/100);
    fill(255, 50);
    pushMatrix();
    translate(x, y);
    rotate(PI/8);
    ellipse(-10, -1, 2*d/5, d*65/100);
    popMatrix();

    fill(255, random(40, 255));
    ellipse(x-5-d/5, y-1-d/5, d/random(7, 12), d/random(7, 12));
    
    //println(id);

  }


  void collide() {
    for (int i= id+1; i<currentTotal; i++) {
      if (dist(others[i].x, others[i].y, x, y) < (others[i].d + d)/3) { 
        collision = true;
        d=0; 


        if (y < 0) {
          y = height;
          d = random(30, 100);
        }
      }
      else {
        collision = false;
      }
    }
  }
}


// class Lightning
// function -- displayLT, wiggleLT(mousepressed), falldownLT(mousereleased)
// boolean -- moveIt

Lightning [] lT = new Lightning[10];

boolean moveIt;

void setup() {

  size(300, 500);

  for (int i=0; i<5; i++) {
    lT[i]= new Lightning();
  }
  moveIt = false;
}

void draw() {

  background(0);

  for (int i=0; i<5; i++) {
    if (lT[i].locY<height+100) { 
      if (moveIt == true) {
        lT[i].fallDown();
      }
    }
    else {
      moveIt = false;
      lT[i].locY = 0;
    } 
    lT[i].display();
    lT[i].wiggle();
  }
}


void mouseReleased() {
  moveIt = !moveIt;
}

class Lightning {

  float locX=0;
  float locY=0;

  Lightning() {
    locX = locX+random(50, 250);
    locY = locY+random(-5, 15);
  }

  void display() {

    float[] lightX= {
      locX, locX+51, locX+30, locX+39, locX-23, locX-2, locX-16
    };
    float[] lightY= {
      locY, locY, locY+30, locY+55, locY+95, locY+55, locY+30
    };

    beginShape();
    fill(random(255), random(255), random(255));
    for (int i=0; i<lightX.length; i++) { 
      vertex(lightX[i], lightY[i]);
    }
    endShape(CLOSE);
  }



  void wiggle() {

    float wigglingbound = random(-2, 2);

    if (mousePressed) {
      locX = locX+wigglingbound;
      locY = locY+wigglingbound;
    }
  }

  void fallDown() {
    
      float gravity = 10;
      locY = locY+gravity;
     
     
      
  }
}













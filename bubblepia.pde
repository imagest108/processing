

int numBubbles = 200;
Bubble[] bubbles = new Bubble[numBubbles];

boolean colorChange = true;





void setup() {
  size(960, 640); 


  for (int i=0; i<numBubbles; i++) {
    bubbles[i] = new Bubble(random(width), random(height), random(20, 100), i, bubbles);
  }

  frameRate(30);
  colorChange = !colorChange;
}





void draw() {
  background(255);
  stroke(255);

  for (int i=0; i<numBubbles; i++) {

    if (colorChange) { 
      bubbles[i].display(1);
      bubbles[i].collide();
    }else{
      bubbles[i].display(2);
      bubbles[i].collide();
    }
  }
}

void mousePressed() {

  setup();
  
}



class Circles {

  int smallX, smallY;
  int smallD;
  int smallColor;

  int bigX, bigY;
  int bigD;
  int bigColor;


  Circles(int cx, int cy) {

    smallX=cx;
    smallY=cy;
    smallD=7;
    smallColor=255;

    bigX=cx;
    bigY=cy;
    bigD=75;
    bigColor=0;
  }

  boolean circleOver(int mx, int my) {
    if (dist(mx, my, bigX, bigY) < bigD/2) {
      return true;
    }
    else {
      return false;
    }
  }

  void displayBig() {

    if (bigColor> 0 && bigColor<= 255) {
      bigColor= bigColor-1;
    }
    else {
      bigColor = 0;
    }  
    strokeWeight(2);
    stroke(255, 50);
    fill(bigColor);   
    ellipse(bigX, bigY, bigD, bigD);
  }

  void displaySmall() {

    if (smallColor>=0 && smallColor<255) {
      smallColor= smallColor+1;
    }
    noStroke();
    fill(smallColor);
    ellipse(smallX, smallY, smallD, smallD);
  }

}

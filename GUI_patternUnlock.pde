int[] savedPositionX = new int[9];
int[] savedPositionY = new int[9];

int[] CX = {
  50, 50, 50, 150, 150, 150, 250, 250, 250
};
int[] CY = {
  50, 150, 250, 50, 150, 250, 50, 150, 250
};


//int[] passwardsX = new int[7];
//int[] passwardsY = new int[7];


int savedNum;
int newNum;
int counter = -1; 

Circles [] circles =new Circles[9];

void setup() {

  size(300, 300);

  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circles(CX[i], CY[i]);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < circles.length; i++) {

    text(counter, 5, 20);
    text(savedNum, 5, 40);
    text(newNum, 5, 60);

    if (circles[i].circleOver(mouseX, mouseY)) {
      circles[i].bigColor= 255;
      circles[i].smallColor=0;

      newNum = i+1;
      if (savedNum !=newNum) {
        if (counter > 5) {
          counter = -1;
          for (int j = 0; j < counter; j++) {
            savedPositionX[j] = 0;
            savedPositionY[j] = 0;
          }
        }

        else {
          counter++;
          //println(counter);
          savedNum = newNum;
          savedPositionX[counter] = circles[i].smallX;
          savedPositionY[counter] = circles[i].smallY;
        }
      }
    }

    circles[i].displayBig();
    circles[i].displaySmall();
  }

  for (int i = 0; i < counter; i++) {
    stroke(255);
    line(savedPositionX[i], savedPositionY[i], savedPositionX[i+1], savedPositionY[i+1]);
    println(savedPositionX[i]+" "+savedPositionY[i]+" "+savedPositionX[i+1]+" "+savedPositionY[i+1]);
  }
}


/*else if(keyPressed){
 if (key=='r') {
 passwardsX[counter] = circles[i].smallX;
 passwardsY[counter] = circles[i].smallY;
 println(passwardsX[counter]+" , "+passwardsY[counter]);
 }*/

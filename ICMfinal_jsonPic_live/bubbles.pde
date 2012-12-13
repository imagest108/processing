
class Bubble {

  float x;
  float y;
  //float yspeed;
  float d;

  float r;
  float g;
  float b;

  Bubble[] others; 

  Bubble(float tempX, float tempY, float tempD) {

    x = tempX;
    y = tempY;

    //yspeed = random(0.5,1.5);
    d = tempD;

    r = random (0, 100);
    g = 36;
    b = random (0, 100);
  }

  boolean collide() {

    boolean c = false;

    // bubble collisions
    for (int i=0; i<bubbles.size(); i++) {
      c |= collide(getBubble(i));
    }

    // wall collisions
    if (x<d) { 
      x = d ; 
      c = true;
    }
    if (x>width-d) { 
      x = width-d ; 
      c = true;
    }
    if (y<d) { 
      y = d; 
      c = true;
    }
    if (y>height-d) { 
      y = height-d ; 
      c = true;
    }

    return c;
  }

  boolean collide(Bubble a) {

    if (a == this) return false;  // no self collision

    float distance = dist(x, y, a.x, a.y);
    float rr =  d + a.d;
    float t = (rr-distance)/rr*2;
    float dx =  t * (x-a.x);
    float dy =  t * (y-a.y);

    if (distance>rr) {
      //float sx = random(0,3);
      //float sy = random(0,3);


      return false;
    }
    else if (distance==rr) {
      dx = 0;
      dy = 0;

      return true;
    }
    else if (distance<rr) {
      x +=dx;
      y +=dy;
      a.x += dx;
      a.y += dy;

      return true;
    }

    return true;
  }

  void display(String myText, int bd) {

    x = x + random(-0.5, 0.5);
    y = y + random(-0.5, 0.5);

    float tx = x;
    float ty = y;

    fill(int(r), int(g), int(b));
    ellipse(x, y, bd, bd);
    fill(255);

   textAlign(CENTER);
   text(myText, x, y);

 
  }
}




/*******************************************************************************************************
 This sketch is parsing facebook data about a specific picture on my facebook.    
 Before running, make sure to update API access token from "http://developers.facebook.com"

 
 12.3.2012   Jess Jiyoung Jung
 *********************************************************************************************************/

import fisica.*;
import processing.opengl.*;
import org.json.*;

String baseURL = "https://graph.facebook.com";
String query   = "/505942842771711"; 

// I get rid of my own apiKey from this code, you can fill in quotation marks

String apiKey  = " ";

String myComments;
int myLikes;

Responses response;

boolean loaded = false;


//Bubbles-----------------------------------------------------------------------

PImage img;
PImage instruction;

ArrayList bubbles = new ArrayList();
int bubbleNum;

boolean drawNewBubble;

//Bubble[] bubbles= new Bubble[bubbleNum];

float bx, by, bd;


void setup() {

  size(800, 800);

  //Bubbles-----------------------------------------------------------------------





  drawNewBubble = false;  

  img = loadImage("myImage.jpg");
  instruction = loadImage("instruction.jpg"); 

  smooth();

  //Data-----------------------------------------------------------------------

  response = new Responses();

  //getFbData();
  thread("getFbData");
}


void draw() {

  background(0);
  noStroke();



  //Data-----------------------------------------------------------------------

  if (frameCount %180 == 0) {
    thread("getFbData");
  }

  if (loaded) {
    drawNewBubble = true;  

    image(img, 0, 0);

    for ( int j = 0; j< response.commentWords.length; j++) {

      bubbleNum = j-1;


      for (int i=0; i < bubbleNum ; i++) {

        bx = random(100, 500);
        by = random(100, 500);
        bubbles.add(new Bubble(bx, by, bd));



        //Bubbles-----------------------------------------------------------------------


        int n = bubbles.size();
        
        for (int b= 0; b<bubbleNum; b++) {
         
          if (b>1) {

            float offset = dist(getBubble(b-1).x, getBubble(b-1).y, bx, by);  
            by = by-offset/2;
            bx = bx-offset/2;
          }
          getBubble(i).display(response.commentWords[i], response.commentWords[i].length()*4+20);
          getBubble(i).collide();
        }
      }
    }
  }
  else {

    image(instruction, 0, 0);
  }
}

void getFbData() {


  String allURL = baseURL + query + "&access_token="+ apiKey;
  String dataChunk  = join(loadStrings(allURL), " ");  


  // comments--------------------------------------------------------------

  JSONObject picData = new JSONObject(dataChunk);
  
  JSONObject allComments = picData.getJSONObject("comments");
  response.comments = allComments.getJSONArray("data");
  //println(response.comments);
  response.commentWords = new String[response.comments.length()];

  for ( int i = 0; i< response.comments.length(); i++) {

    JSONObject tempC = response.comments.getJSONObject(i);
    //println(tempC);
    //println("--------");
    response.commentWords[i] = tempC.getString("message");
  }
  println(response.commentWords);


  //println(response.commentWords.length + "comments found");

  // likes--------------------------------------------------------------

  //println(data);
  JSONObject allLikes = picData.getJSONObject("likes");
  response.likes = allLikes.getJSONArray("data");
  myLikes = response.likes.length();
  
  loaded = true;
}



Bubble getBubble(int i) {
  return (Bubble) bubbles.get(i);
}


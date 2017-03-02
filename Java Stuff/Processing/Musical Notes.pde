/*
43312942
COMP115 2016
Assignment 1 Excercise 2 & 3
*/

//global variables named after notes on the stave
int f5 = 30;
int e5 = 43;
int d5 = 55;
int c5 = 68;
int b4 = 80;
int a4 = 93;
int g4 = 105;
int f4 = 118;
int e4 = 130;

void setup() {
   size(520,160);
   background(255);
}

void draw() {
//staves

  //end staves
  stroke(0);
  strokeWeight(15);
  strokeCap(SQUARE);
  line(10,f5,10,e4);
  line(width-10,f5,width-10,e4);
  
  //middle staves
  stroke(0);
  strokeWeight(1);
  line(10,f5,width-10,f5);
  line(10,d5,width-10,d5);
  line(10,b4,width-10,b4);
  line(10,g4,width-10,g4);
  line(10,e4,width-10,e4);
}

//notes
void mousePressed () {
  //this corrects to ensure no overlap with end staves 
  if (mouseButton == LEFT && mouseX>30 && mouseX<width-30)
      {
       /*notes stave actually should be on left when above the midway on stave, but I will change this to fit assignment specs. same for the notes f5 and e4, which should be there but to fit assignment are removed
       notes have been given a range to click and still work, as having too precise makes it hard for user to click*/
       
       //note staves pointing down
      if ((mouseY >= e5) && (mouseY < e5 +12)){
        noFill();
        ellipse (mouseX,e5,25,25);
        line (mouseX + 13, e5, mouseX + 13, e5+ 75);
        }
      if ((mouseY >= d5) && (mouseY < d5 +12)){
        noFill();
        ellipse (mouseX,d5,25,25);
        line (mouseX + 13, d5, mouseX + 13, d5+ 75);
        }
      if ((mouseY >= c5) && (mouseY < c5 +12)){
        noFill();
        ellipse (mouseX,c5,25,25);
        line (mouseX + 13, c5, mouseX + 13, c5+ 75);
        }
      if ((mouseY >= b4) && (mouseY < b4 +12)){
        noFill();
        ellipse (mouseX,b4,25,25);
        line (mouseX + 13, b4, mouseX + 13, b4+ 75);
        }
        
      //note staves going up in music should always be from a4 in the treble clef and below
      if ((mouseY >= a4) && (mouseY < a4 +12)){
        noFill();
        ellipse (mouseX,a4,25,25);
        line (mouseX + 13, a4, mouseX + 13, a4 - 75);
        }
      if ((mouseY >= g4) && (mouseY < g4 +12)){
        noFill();
        ellipse (mouseX,g4,25,25);
        line (mouseX + 13, g4, mouseX + 13, g4 - 75);
        }
      if ((mouseY >= f4) && (mouseY < f4 +12)){
        noFill();
        ellipse (mouseX,f4,25,25);
        line (mouseX + 13, f4, mouseX + 13, f4 - 75);
        }
    }
}

//clear the bar

void keyPressed () {
  if (keyPressed) {
    if (key == 'c') {
      background(255);
   
 //staves

    /*end staves*/
    stroke(0);
    strokeWeight(15);
    strokeCap(SQUARE);
    line(10,f5,10,e4);
    line(width-10,f5,width-10,e4);
    
    /*middle staves*/
    stroke(0);
    strokeWeight(1);
    line(10,f5,width-10,f5);
    line(10,d5,width-10,d5);
    line(10,b4,width-10,b4);
    line(10,g4,width-10,g4);
    line(10,e4,width-10,e4);
    }
  }
}
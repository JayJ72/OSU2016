/* 43312942 COMP115 Assignment 2 2016 */


/* Returns Random Numbers*/
int randomInt (int upper) {
  return int(random(1, upper));
}

int planeX= 256;
int planeY= height/2;
int count= 0;
int levelCount =0;
int[] barrierX = new int[11];
int[] barrierY = new int[11];
int barrierDia=100;
int barrierNum =(randomInt(11));


void setup() {
  size(512,768);
  /*Array Values*/
  for (int i=1; i<11; i++) {
    barrierX[i] = int(randomInt(width-100));
    barrierY[i] = int(randomInt(height-100));
  }
}

void draw() {
  
  drawWall();
  
  drawScore();
  
  drawBarrier();
  
  /*Plane Controls*/
  
  if (count == -1) {
    drawPlaneLeft();
    }
  if (count <= -2) {
    drawPlaneXtraLeft();
    }
  if (count == 1) {
    drawPlaneRight();
    }
  if (count >=2) {
     drawPlaneXtraRight();
    }
  if (count ==0) {
    drawPlane();
    }
  
  /*Set Invisible Side Walls*/
  
  if (planeX < 10) {
    planeX =10;
  }
  if (planeX > width-10) {
    planeX = width-10;
  }
  
  /* Plane Crashes If Hits Barrier */
  for (int i=1; i<barrierNum; i ++) {
    if (barrierY[i] > 200) {
      if (dist(planeX, planeY, barrierX[i], barrierY[i]) <= barrierDia/2) {
        drawPlaneCrash();
        noLoop(); //Stop Game When Hits Barrier
      }
    }
  }
  
  /*Pause and Unpause Function*/
  if (keyCode == BACKSPACE) {
      noLoop();
     }
  if (keyCode == SHIFT) {
      loop();
  }
  
  /*Have the Game Run Continuously*/
  if (planeY > height) {
    planeY =0;
    levelCount ++;
    for (int i=1; i<11; i++) {
      barrierX[i]= randomInt(width-100);
      barrierY[i]= randomInt(height-100);
      barrierNum=(randomInt(11));
    }
  }
}


/* Functions */

void drawPlane() {
  stroke(0);
  fill(255);
  triangle(planeX,planeY,planeX+10,planeY-20,planeX-10,planeY-20);
  fill(0);
  triangle(planeX,planeY-15,planeX+2,planeY-20,planeX-2,planeY-20);
  line(planeX,planeY-8,planeX,planeY-20);
  
  /*Levels - Plane Gets Faster*/
  if (levelCount <= 5) {
    planeY+=5;
  }
  if (levelCount >5 && levelCount <=10) {
    planeY+=6;
  }
  if (levelCount >10 && levelCount <=15) {
    planeY+=7;
  }
  if (levelCount >15 && levelCount <=20) {
    planeY+=8;
  }
  if (levelCount >20 && levelCount <=25) {
    planeY+=9;
  }
  if (levelCount >25 && levelCount <=30) {
    planeY+=10;
  }
  if (levelCount >30 && levelCount <=35) {
    planeY+=11;
  }
  if (levelCount >35 && levelCount <=40) {
    planeY+=12;
  }
  if (levelCount >40 && levelCount <=45) {
    planeY+=13;
  }
  if (levelCount >50 && levelCount <=55) {
    planeY+=14;
  }
  if (levelCount >55 && levelCount <=60) {
    planeY+=15;
  }
  if (levelCount >60 && levelCount <=65) {
    planeY+=16;
  }
  if (levelCount >65 && levelCount <=70) {
    planeY+=17;
  }
  if (levelCount >75 && levelCount <=80) {
    planeY+=18;
  }
  if (levelCount >80 && levelCount <=85) {
    planeY+=19;
  }
  if (levelCount >85 && levelCount <=90) {
    planeY+=20;
  }
  if (levelCount >90 && levelCount <=95) {
    planeY+=21;
  }
  if (levelCount >95 && levelCount <=100) {
    planeY+=22;
  }
}

void drawPlaneLeft() {
  stroke(0);
  fill(255);
  triangle(planeX-10,planeY,planeX+10,planeY-20,planeX-10,planeY-20);
  fill(0);
  triangle(planeX-3,planeY-15,planeX+2,planeY-20,planeX-2,planeY-20);
  line(planeX-7,planeY-8,planeX,planeY-20);
  
    /*Levels - Plane Gets Faster*/
  planeX-=2;
  if (levelCount <= 5) {
    planeY+=3;
  }
  if (levelCount >5 && levelCount <=10) {
    planeY+=4;
  }
   if (levelCount >10 && levelCount <=15) {
    planeY+=5;
  }
   if (levelCount >15 && levelCount <=20) {
    planeY+=6;
  }
  if (levelCount >20 && levelCount <=25) {
    planeY+=7;
  }
  if (levelCount >25 && levelCount <=30) {
    planeY+=8;
  }
  if (levelCount >30 && levelCount <=35) {
    planeY+=9;
  }
  if (levelCount >35 && levelCount <=40) {
    planeY+=10;
  }
  if (levelCount >40 && levelCount <=45) {
    planeY+=11;
  }
  if (levelCount >50 && levelCount <=55) {
    planeY+=12;
  }
  if (levelCount >55 && levelCount <=60) {
    planeY+=13;
  }
  if (levelCount >60 && levelCount <=65) {
    planeY+=14;
  }
  if (levelCount >65 && levelCount <=70) {
    planeY+=15;
  }
  if (levelCount >75 && levelCount <=80) {
    planeY+=16;
  }
  if (levelCount >80 && levelCount <=85) {
    planeY+=17;
  }
  if (levelCount >85 && levelCount <=90) {
    planeY+=18;
  }
  if (levelCount >90 && levelCount <=95) {
    planeY+=19;
  }
  if (levelCount >95 && levelCount <=100) {
    planeY+=20;
  }
}
void drawPlaneRight() {
  stroke(0);
  fill(255);
  triangle(planeX+10,planeY,planeX+10,planeY-20,planeX-10,planeY-20);
  fill(0);
  triangle(planeX+3,planeY-15,planeX+2,planeY-20,planeX-2,planeY-20);
  line(planeX+7,planeY-8,planeX,planeY-20);
  
   /*Levels - Plane Gets Faster*/
  planeX+=2;
  if (levelCount <= 5) {
    planeY+=3;
  }
  if (levelCount >5 && levelCount <=10) {
    planeY+=4;
  }
  if (levelCount >10 && levelCount <=15) {
    planeY+=5;
  }
  if (levelCount >15 && levelCount <=20) {
    planeY+=6;
  }
  if (levelCount >20 && levelCount <=25) {
    planeY+=7;
  }
  if (levelCount >25 && levelCount <=30) {
    planeY+=8;
  }
  if (levelCount >30 && levelCount <=35) {
    planeY+=9;
  }
  if (levelCount >35 && levelCount <=40) {
    planeY+=10;
  }
  if (levelCount >40 && levelCount <=45) {
    planeY+=11;
  }
  if (levelCount >50 && levelCount <=55) {
    planeY+=12;
  }
  if (levelCount >55 && levelCount <=60) {
    planeY+=13;
  }
  if (levelCount >60 && levelCount <=65) {
    planeY+=14;
  }
  if (levelCount >65 && levelCount <=70) {
    planeY+=15;
  }
  if (levelCount >75 && levelCount <=80) {
    planeY+=16;
  }
  if (levelCount >80 && levelCount <=85) {
    planeY+=17;
  }
  if (levelCount >85 && levelCount <=90) {
    planeY+=18;
  }
  if (levelCount >90 && levelCount <=95) {
    planeY+=19;
  }
  if (levelCount >95 && levelCount <=100) {
    planeY+=20;
  }
}
void drawPlaneXtraLeft() {
  stroke(0);
  fill(255);
  triangle(planeX-10,planeY,planeX+10,planeY+10,planeX+10,planeY-10);
  fill(0);
  triangle(planeX+7,planeY,planeX+10,planeY-3,planeX+10,planeY+3);
  line(planeX,planeY,planeX+10,planeY);
  
   /*Levels - Plane Gets Faster*/
  planeX-=4;
  if (levelCount <= 5) {
    planeY+=1;
  }
  if (levelCount >5 && levelCount <=10) {
    planeY+=2;
  }
  if (levelCount >10 && levelCount <=15) {
    planeY+=3;
  }
  if (levelCount >15 && levelCount <=20) {
    planeY+=4;
  }
  if (levelCount >20 && levelCount <=25) {
    planeY+=5;
  }
  if (levelCount >25 && levelCount <=30) {
    planeY+=6;
  }
  if (levelCount >30 && levelCount <=35) {
    planeY+=7;
  }
  if (levelCount >35 && levelCount <=40) {
    planeY+=8;
  }
  if (levelCount >40 && levelCount <=45) {
    planeY+=9;
  }
  if (levelCount >50 && levelCount <=55) {
    planeY+=10;
  }
  if (levelCount >55 && levelCount <=60) {
    planeY+=11;
  }
  if (levelCount >60 && levelCount <=65) {
    planeY+=12;
  }
  if (levelCount >65 && levelCount <=70) {
    planeY+=13;
  }
  if (levelCount >75 && levelCount <=80) {
    planeY+=14;
  }
  if (levelCount >80 && levelCount <=85) {
    planeY+=15;
  }
  if (levelCount >85 && levelCount <=90) {
    planeY+=16;
  }
  if (levelCount >90 && levelCount <=95) {
    planeY+=17;
  }
  if (levelCount >95 && levelCount <=100) {
    planeY+=18;
  }
}
void drawPlaneXtraRight() {
  stroke(0);
  fill(255);
  triangle(planeX+10,planeY,planeX-10,planeY-10,planeX-10,planeY+10);
  fill(0);
  triangle(planeX-7,planeY,planeX-10,planeY+3,planeX-10,planeY-3);
  line(planeX,planeY,planeX-10,planeY);
  
  /*Levels - Plane Gets Faster*/
  planeX+=4;
  if (levelCount <= 5) {
    planeY+=1;
  }
  if (levelCount >5 && levelCount <=10) {
    planeY+=2;
  }
  if (levelCount >10 && levelCount <=15) {
    planeY+=3;
  }
  if (levelCount >15 && levelCount <=20) {
    planeY+=4;
  }
  if (levelCount >20 && levelCount <=25) {
    planeY+=5;
  }
  if (levelCount >25 && levelCount <=30) {
    planeY+=6;
  }
  if (levelCount >30 && levelCount <=35) {
    planeY+=7;
  }
  if (levelCount >35 && levelCount <=40) {
    planeY+=8;
  }
  if (levelCount >40 && levelCount <=45) {
    planeY+=9;
  }
  if (levelCount >50 && levelCount <=55) {
    planeY+=10;
  }
  if (levelCount >55 && levelCount <=60) {
    planeY+=11;
  }
  if (levelCount >60 && levelCount <=65) {
    planeY+=12;
  }
  if (levelCount >65 && levelCount <=70) {
    planeY+=13;
  }
  if (levelCount >75 && levelCount <=80) {
    planeY+=14;
  }
  if (levelCount >80 && levelCount <=85) {
    planeY+=15;
  }
  if (levelCount >85 && levelCount <=90) {
    planeY+=16;
  }
  if (levelCount >90 && levelCount <=95) {
    planeY+=17;
  }
  if (levelCount >95 && levelCount <=100) {
    planeY+=18;
  }
}

void drawBarrier() {
  for (int i =0; i < barrierNum; i++) { //<>//
    if (barrierY[i]>200) { //Stop Barrier Generating Too Early
      stroke(0); //<>//
      fill(255); //<>//
      ellipse(barrierX[i],barrierY[i],barrierDia,barrierDia); //<>//
    }
  }
}

void drawScore() {
  fill (255);
  textSize(30);
  text("Score:", 2*width/3, 40);
  text(count/5, 2*width/3, 80);
}

void drawPlaneCrash() {
  stroke(0);
  fill(255);
  triangle(planeX-4,planeY-4,planeX,planeY-4,planeX-2,planeY);
  triangle(planeX+12,planeY-8,planeX+16,planeY-4,planeX+12,planeY-4);
  triangle(planeX+8,planeY+8,planeX+10,planeY+14,planeX+6,planeY+12);
  triangle(planeX-8,planeY-10,planeX-16,planeY-4,planeX-8,planeY+4);
  fill(255);
  text("GAME OVER, YOU LOSE", width/6, height/2);
}

void drawWall() {
  
  background(#604147);
  stroke(#9d8b4e);
  
  int wallCount=1;
  int h =0;
  while (h<height) {
    line(0,h,width,h);
      h+=15;
      wallCount+=1;
  if (wallCount %2 == 0) {
    for (int v=0; v<width; v+=35) {
      line(v, h+15, v, h);
      }
    } 
  else
    for (int v=17; v<width; v+=35) {
      line(v, h+15, v, h);
      }
   }
}

void keyPressed() {
  
  /* Reset Game */
  
  if (key == ENTER || key == RETURN || key == ' ') {
    planeY=0;
    levelCount =0;
    for (int i=0; i<11; i++) {
      barrierX[i]= randomInt(width-100);
      barrierY[i]= randomInt(height-100);
      barrierNum=(randomInt(11));
    }
    loop(); //Start Game Again
  }
  
  /* Count for Plane Directions */
  
  if (key == CODED) {
     if (keyCode == LEFT) {
       count--;
     }
     if (keyCode == RIGHT) {
       count++;
     }
     if (keyCode == DOWN && count >0) {
       count--;
     }
     if (keyCode == DOWN && count <0) {
       count++;
     }
  }
}


  
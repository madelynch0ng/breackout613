int ff;

void gameover() {
  background(0);
  println(frameCount);
  if (frameCount %1.8==0) ff++;  
  if (ff == numberOfFrames)ff=0;
  textAlign(CENTER, CENTER);
  textSize(100);
  fill(255);

  // return to intro page==================================
  fill(0);
  noStroke();

  rect(300, 550, 200, 200);
  rect(300, 650, 200, 50);
  fill(255);
  textSize (50);
  text("HOME", 400, 670);

  rect( 550, 650, 200, 100);
  
  //(0);
  textSize(50);
  text("QUIT", 620, 700);
}


void gameoverClicks() {
  if (mouseX>300 && mouseX < 500 && mouseY >650 &&  mouseY< 700 ) {
    mode=INTRO;

  } else if (mouseX > 550 && mouseX< 750 && mouseY > 650 && mouseY < 750) {
    exit();
  }
}

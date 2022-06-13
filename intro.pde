int f;

void intro() {
  background(255);
  fill(0);

  image(gif[f], 0, 0, width, height);
  println(frameCount);
  if (frameCount %2==0) f++;
  if (f == numberOfFrames)f=0;

  noStroke();
  textAlign(CENTER, CENTER);
  textSize(150);
  text("BreackOUT", 400, 400);
}

void introClicks() {
  mode = GAME;
}

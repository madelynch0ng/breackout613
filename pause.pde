void pause() {
  textSize(100);
  text("PAUSED",400,400);
}

void pauseClicks() {
  if (mouseX > 720 && mouseX < 780 && mouseY > 30 && mouseY < 90) {
    mode=GAME;
  }
}

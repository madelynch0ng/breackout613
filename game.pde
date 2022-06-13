void game() {
 
  background(0);

  // paddle======================================= 
  fill(b10);
  noStroke();
  circle(px, py, pd);
  if (rightkey) px = px +5;
  if (leftkey) px = px -5;

  if (px <= 50 || px >= 750) {
    rightkey = false;
    leftkey = false;
    px = max(pd, 750);
    px = min(pd, 50);
  }

  //ball===========================================================
  fill(b9);
  circle ( bx, by, bd );
  bx = bx + vx ;
  by = by + vy ;

  //bouncing 
  if (dist ( bx, by, px, py ) < bd /2 + pd /2) { // bouncing of the sides
    vx = ( bx - px ) / 10 ;
    vy = ( by - py ) / 10 ;
  }
  if ( bx < bd /2 || bx > width- bd /2) { // bouncing off the sides
    vx = vx * -1;
  }
  if ( by < bd /2 || by > height - bd /2) {// bouncing off the top
    vy = vy * -1;
  }
  //bricks==========================================================================================================================================================
  int i = 0;
  while (i <  n ) {
    if (alive[i]==true) {
      manageBrick(i);
    }
    i++;
  }

  //score
  fill (255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Score:" + score, 100, 50);

  //lives
  text("LIVES:" + lives, 190, 50);
}

void manageBrick(int i) {
  if ( y[i]==80) fill (b1);
  if ( y[i]==100) fill (b1);
  if ( y[i]==120) fill (b1);
  if ( y[i]==140) fill (b2);
  if ( y[i]==160) fill (b2);
  if ( y[i]==180) fill (b2);
  if ( y[i]==200) fill (b3);
  if ( y[i]==220) fill (b3);
  if ( y[i]==240) fill (b3);
  if ( y[i]==260) fill (b4);
  if ( y[i]==280) fill (b4);
  if ( y[i]==300) fill (b4);
  if ( y[i]==320) fill (b5); 
  if ( y[i]==340) fill (b5);
  if ( y[i]==360) fill (b5);
  if ( y[i]==380) fill (b6);
  if ( y[i]==400) fill (b6);
  if ( y[i]==420) fill (b6);  
  if ( y[i]==440) fill (b7);
  if ( y[i]==460) fill (b7); 
  if ( y[i]==480) fill (b7);
  if ( y[i]==500) fill (b8);

  circle(x[i], y[i], brickd);  // key: draw the brick on page i insteads of 0
  if ( dist ( bx, by, x[i], y [i]) < bd/2 + brickd/2 ) {
    vx = ( bx - x [i] ) / 10 ;
    vy = ( by - y [i] ) / 10 ;
    alive[i] = false;
    score++;/////////////////////////////////////////////////ADD SCORE
  }

  // lives
  if (by >=795) lives--;

  //pause button
  fill(255);
  text("ll", 750, 60);
}

void gameClicks() {        
  if (score == 3) mode = GAMEOVER;
  if (lives <= 0) mode = GAMEOVER;
  if (mouseX > 720 && mouseX < 780 && mouseY > 30 && mouseY < 90) {
    mode=PAUSE;
  }
}

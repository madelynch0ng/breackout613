//Breackout 
//Madelyn Chong
///// VIDEO 8K: work--》 and YOUWIN or YOULOSS WHAT score do you need to win to win

//color pallet 
PFont font;
color b1  = #7400b8;
color b2  = #6930c3;
color b3  = #5e60ce;
color b4  = #5390d9;
color b5  = #4ea8de;
color b6  = #48bfe3;
color b7  = #56cfe1;
color b8  = #64dfdf;
color b9  = #72efdd;
color b10 = #80ffdb;

//brick Variables
int []x;
int []y;
boolean[]alive;
int brickd;
int n ;
int tempx, tempy;
int score, lives;

//mode framework;
int mode;
final int INTRO =1;
final int GAME= 2;
final int  PAUSE =3 ;
final int GAMEOVER=4;

float px, py, pd, bx, by, bd, vx, vy;

PImage[] gif;
int numberOfFrames;

//keyboard variables 
boolean rightkey, leftkey; 

void setup() {
  brickd = 20;
  n =  748 ;
  x = new int [n];
  y = new int [n];
  alive = new boolean[n];
  tempx =  60 ;   //where is going to be next brick
  tempy = 80;

  // font
  font = loadFont( "AgencyFB-Reg-48.vlw");
textFont(font);
  //GIF
  numberOfFrames = 77;
  gif  = new PImage[numberOfFrames];

  int m = 0;
  while (m < numberOfFrames) {
    gif[m]  = loadImage("frame_"+m+"_delay-0.07s.gif");
    m++;
  }

  int i = 0 ;
  while ( i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 20;
    if ( tempx == width-60) {
      tempx = 60;
      tempy = tempy + 20;
    }
    i++;
  }
  size (800, 800); //FX2D increases everythings size
  mode= INTRO;/////////////////-----------------------------------

  // initialize paddles
  px = width/2;
  py = height;
  pd=  100;
  vx = 0;
  vy = 1;
  leftkey = rightkey = false;

  // initialized score+lives
  score = 0;
  lives = 3;

  //initialize ball
  bx = width/2;
  by= height-200;
  bd= 10;

  //initialize keyboard variables
  rightkey= leftkey = false;
}

void draw() {
  if ( mode== INTRO) {
    intro();
  } else if ( mode== GAME) {
    game();
  } else if (mode== PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else { 
    println( "Mode error in draw:" + mode);
  }
}

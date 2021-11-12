PImage bgrnd;
PImage scuba;
float mapVal;
character c1 = new character();

void setup() {
  //Map update
  mapVal = 0;
  
  //Background loading
  bgrnd = loadImage("Background.png");
  
  //Scuba loadin
  scuba = loadImage("Scuba.png");

  size(1280, 720);
  background(255);
}

void draw() {
 // println("Map Val: " + mapVal);
  background(255);
  image(bgrnd, mapVal, -300);

  stroke(0);
  fill(0, 255, 255);
  rect(400+mapVal, 400, 600, 30);
  rect(0+mapVal, 620, 1280, 100);
  rect(1600+mapVal, 620, 500, 100);
  c1.playerdraw(false);
  c1.move();
}

void keyPressed() {
  if (key == 'w') {
    c1.U = true;
  } else if (key == 's') {     
    c1.D = true;
  } else if (key == 'd') {
    c1.R = true;
  } else if (key == 'a') {
    c1.L = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    c1.U = false;
  } else if (key == 's') {     
    c1.D = false;
  } else if (key == 'd') {
    c1.R = false;
  } else if (key == 'a') {
    c1.L = false;
  }
}

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
  
}

void keyPressed() {
  if (key == 'w') {
    c1.move(true, false, false, false);
  } else if (key == 's') {     
    c1.move(false, true, false, false);
  } else if (key == 'd') {
    if ((c1.playerXLeft +c1.playerXRight) / 2 >= (width / 2)) {
      mapVal-= 10;
    } else {
      c1.move(false, false, false, true);
    }
  } else if (key == 'a') {
    if (c1.playerXLeft <= 0) {
      if (mapVal != 0) {
        mapVal += 10;
      }
    } else {
      c1.move(false, false, true, false);
    }  
  }
}

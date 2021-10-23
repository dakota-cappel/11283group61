float playerXLeft, playerXRight; //<>//
float playerYTop, playerYBottom;
PImage bgrnd;
entity[] entities = new entity[1000];
//Item[] Inventory = new Inventory[9];
float mapVal;
float occ;

class entity {
  private float xLeft, xRight;
  private float yTop, yBottom;
  private float entDir, speed;
  private float xStart, yStart;
  private String type;
  private boolean alive;

  //Start values, width, height
  public entity(String name, float xstart, float ystart, float xwidth, float yheight, float dir, float inpSpeed) {
    alive = true;
    type = name;
    xLeft = xstart;
    xRight = xstart+xwidth;
    yTop = ystart;
    yBottom = ystart+yheight;
    entDir = dir;
    xStart = xstart;
    yStart = ystart;
    speed = inpSpeed;
  }

  void drawAlg() {
    fill(57, 255, 20);
    
    //Checks horizontal vs vertical
    if (Math.abs(entDir)==1) {
      if (xRight >= xStart+mapVal+300)
        entDir = -1;
      else if (xLeft <= xStart+mapVal-300)
        entDir = 1;
      xLeft += entDir * speed;
      xRight+= entDir * speed;
    }
    
    //Vertical
    else {
      if (yTop >= yStart+100)
        entDir=-2;
      else if (yBottom <= yStart-100)
        entDir=2;
      yTop+= entDir/2 * speed;
      yBottom+= entDir/2 * speed;
    }

    rect(xLeft, yTop, 100, 100);
  }
}

void checkEntityCollision(entity ent) {
  //Checking collision of player and algae1
  if (((playerXRight>=ent.xLeft && playerXRight <= ent.xRight) || (playerXLeft >= ent.xLeft && playerXLeft <= ent.xRight)) && (((playerYBottom>=ent.yTop) && (playerYBottom<=ent.yBottom)) || ((playerYTop>=ent.yTop) && (playerYTop <= ent.yBottom)))) {
    println("COLLIKSION AOHHHHHHHHHHHH");
  }
}

void setup() {
  //Initializing the player
  playerXLeft = 100;
  playerXRight = 160;
  playerYTop = 520;
  playerYBottom = 620;

  //Map update
  mapVal = 0;

  //Background loading
  bgrnd = loadImage("Background.png");

  //Initializing algae left
  entity alg1 = new entity("algae", 275, 370, 100, 100, 2, 3);
  entities[0] = alg1;
  occ+=1;

  //Top
  entity alg2 = new entity("algae", 700, 300, 100, 100, -1, 3);
  entities[1] = alg2;
  occ+=1; 

  //Ground Right
  entity alg3 = new entity("algae", 900, 520, 100, 100, 1, 2.85);
  entities[2] = alg3;
  occ+=1;
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

  for (int i = 0; i < occ; i++) {
    entities[i].drawAlg();  
    checkEntityCollision(entities[i]);
  }
  player();
}

void keyPressed() {
  if (key == 'w') {
    playerYTop-=10;
    playerYBottom-=10;
  } else if (key == 's') {     
    playerYTop+=10;    
    playerYBottom+=10;
  } else if (key == 'd') {
    if (playerXRight >= mapVal) {
      mapVal -= 10;
      for (int i = 0; i < occ; i++) {
        entities[i].xLeft -= 10;
        entities[i].xRight -= 10;
      }
    } else {
      playerXRight += 10;
      playerXLeft += 10;
    }
  } else if (key == 'a') {
    if (playerXLeft < mapVal) {
      if (mapVal<0) {
      mapVal+=10;

        for (int i = 0; i < occ; i++) {
          entities[i].xLeft += 10;
          entities[i].xRight += 10;
        }
      }
    } else {
      playerXRight -= 10;
      playerXLeft -= 10;awd
    }
  }
}

void player() {
  fill(255, 0, 0);
  rect(100, playerYTop, 60, 90);
}

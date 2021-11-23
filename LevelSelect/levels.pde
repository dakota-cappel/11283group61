platform[] L1 =  new platform[10];
platform[] L2 =  new platform[15];
platform[] L3 =  new platform[20];
float mapVal;
float backVal;
float floorVal;
float stageLength;

void lvlReset() {
  backVal = 0;
  mapVal = 0;
}

void resetLvl1(){
  mapVal = 0; 
  for(int i = 0; i < lvl1entities.length; i++){
      if(i==lvl1occ)
        break;
      println("reached1 ", i);
      lvl1entities[i].alive = true;
      println("reached2");
      lvl1entities[i].xLeft = lvl1entities[i].xLeftHold;
      println("reached3");
      lvl1entities[i].xRight = lvl1entities[i].xRightHold;
      println("reached4");
      lvl1entities[i].yTop = lvl1entities[i].yTopHold;
      println("reached5");
      lvl1entities[i].yBottom = lvl1entities[i].yBottomHold;
      println("reached6");
      lvl1entities[i].entDir = lvl1entities[i].entDirHold;
      println("reached7");
      lvl1entities[i].xStart = lvl1entities[i].xStartHold;
      println("reached8");
      lvl1entities[i].yStart = lvl1entities[i].yStartHold;
      println("reached9");
      lvl1entities[i].speed = lvl1entities[i].speedHold;
   }
   for(int i = 0; i < Inventory.length; i++){
     Inventory[i] = null;
   }
    c1.equippethed = false;
    c1.playerXLeft = 100;
    c1.playerXRight = 150;
    c1.playerYTop = 520;
    c1.playerYBottom = 620;
    c1.direction = 0;
    c1.hearts = 3;
}

void displayLevel1() {
  // println("Map Val: " + mapVal);
  stageLength = 7000;
  floorVal = 650;
  makePlatforms1();
  image(bgrnd, backVal, 0);
  
  noStroke();
  noFill();
  rect(0, 620, 1280, 100);
  stroke(0);
  fill(0, 255, 255);
  for (int i = 0; i < L1.length; i++) {
    L1[i].drawPlatform();
    L1[i].checkCollisions();
  }
  
  for (int i = 0; i < stageLength; i += 1280) {
    image(ground, i+mapVal, 620);
  }
  
  c1.playerdraw(false);
  c1.loaded = true;
  c1.move();
  
  if (back.MouseIsOver()) {
      back.drawActiveButton();
    } else {
      back.drawButton();
    }
    if (inventory.MouseIsOver()) {
      inventory.drawActiveButton();
    } else {
      inventory.drawButton();
    }
    
  //Entity Drawer / Collision Checker
  for (int i = 0; i <lvl1occ; i++) {
    lvl1entities[i].drawEnt(lvl1entities[i].type);  
    lvl1entities[i].checkEntityCollision("Player");
  }
  for(int i = 0; i < c1.hearts; i++){
    image(heart,170+100*i,40);  
  }
}

void displayLevel2() {
  background(66,135,245);
  stroke(0);
  fill(0, 255, 255);
  
  
  
  if (back.MouseIsOver()) {
      back.drawActiveButton();
    } else {
      back.drawButton();
    }
    if (inventory.MouseIsOver()) {
      inventory.drawActiveButton();
    } else {
      inventory.drawButton();
    }
}

void displayLevel3() {
  background(152,190,100);
  stroke(0);
  fill(0, 255, 255);
  
  if (back.MouseIsOver()) {
      back.drawActiveButton();
    } else {
      back.drawButton();
    }
    if (inventory.MouseIsOver()) {
      inventory.drawActiveButton();
    } else {
      inventory.drawButton();
    }
}

void makePlatforms1() {
  L1[0] = new platform(400, 400, 600, 30);
  L1[1] = new platform(1150, 400, 100, 300);
  L1[2] = new platform(1550, 5, 800, 200);
  L1[3] = new platform(2600, 400, 100, 200);
  L1[4] = new platform(2600, 0, 100, 200);
  L1[5] = new platform(3600, 200, 70, 500);
  L1[6] = new platform(4300, 0, 70, 500);
  L1[7] = new platform(5000, 280, 300, 50);
  L1[8] = new platform(5700, 280, 300, 50);
  L1[9] = new platform(6500, 590, 400, 30);
}

void makePlatforms2() {}
void makePlatforms3() {}

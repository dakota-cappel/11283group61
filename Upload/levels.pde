void displayLevel1() {
  // println("Map Val: " + mapVal);
    
  image(bgrnd, mapVal, -300);

  stroke(0);
  fill(0, 255, 255);
  rect(400+mapVal, 400, 600, 30);
  rect(0+mapVal, 620, 1280, 100);
  rect(1600+mapVal, 620, 500, 100);
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

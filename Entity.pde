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

  void drawEnt(String name){
    if(alive == false){
      xLeft = -1000;
      xRight = -1000;
      yTop = -1000;
      yBottom = -1000;
      entDir = 0;
      xStart = -1000;
      yStart = -1000;
      speed = 0;
    }
    else if(name == "Algae"){
      drawAlg(); 
    }
    else if(name == "Net"){
      drawNet(); 
    }
  }
  
  void drawNet(){
     fill(1,23,23);
     if(yTop >= yStart+10)
         entDir = -1;
     else if (yBottom <= yStart-10)
         entDir=1;
     yTop+=entDir*speed;
     yBottom+=entDir*speed;
     rect(xLeft,yTop,40,15);
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
  
  boolean checkEntityCollision() {
  //Checking collision of player and algae1
  if (type == "Algae"&&((c1.playerXRight>=xLeft && c1.playerXRight <= xRight) || (c1.playerXLeft >= xLeft && c1.playerXLeft <= xRight)) && (((c1.playerYBottom>=yTop) && (c1.playerYBottom<=yBottom)) || ((c1.playerYTop>=yTop) && (c1.playerYTop <= yBottom)))) {
    textSize(20);
    fill(0,255,255);
    text("COLLISION ALAGEAE", 420, 40);
    return true;
  }
  if (type == "Net"&&((c1.playerXRight>=xLeft && c1.playerXRight <= xRight) || (c1.playerXLeft >= xLeft && c1.playerXLeft <= xRight)) && (((c1.playerYBottom>=yTop) && (c1.playerYBottom<=yBottom)) || ((c1.playerYTop>=yTop) && (c1.playerYTop <= yBottom)))) {
    alive = false;
    Inventory[invCount] = new Item("Net");
    return true;
  }

  return false;
  }
  
  //float playerXLeft, playerXRight;
  //float playerYTop, playerYBottom;
}

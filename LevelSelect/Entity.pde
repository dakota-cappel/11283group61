class entity {
  private float xLeft, xRight;
  private float yTop, yBottom;
  private float xLeftHold, xRightHold, yTopHold, yBottomHold, entDirHold, speedHold, xStartHold, yStartHold;
  private float entDir, speed;
  private float xStart, yStart;
  private float radius;
  private String type;
  private boolean alive;
  private float cx, cy;

  //Start values, width, height
  public entity(String name, float xstart, float ystart, float xwidth, float yheight, float dir, float inpSpeed, float dirRadius, float centx, float centy) {
    alive = true;
    type = name;
    xLeft = xstart; xLeftHold = xstart;
    xRight = xstart+xwidth; xRightHold = xstart+xwidth;
    yTop = ystart; yTopHold = ystart;
    yBottom = ystart+yheight; yBottomHold = ystart+yheight;
    entDir = dir; entDirHold = dir;
    xStart = xstart; xStartHold = xstart;
    yStart = ystart; yStartHold = ystart;
    speed = inpSpeed; speedHold = inpSpeed;
    radius = dirRadius;
    cx = centx;
    cy = centy;
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
    else if(name == "Circ"){
      drawCircAlg(); 
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
     image(net,xLeft,yTop,40,20);
  }
  
  void drawAlg() {
    fill(57, 255, 20);
    
    //Checks horizontal vs vertical
    if (Math.abs(entDir)==1) {
      if (xRight >= xStart+mapVal+radius)
        entDir = -1;
      else if (xLeft <= xStart+mapVal-radius)
        entDir = 1;
      xLeft += entDir * speed;
      xRight+= entDir * speed;
    }
    
    //Vertical
    else if (Math.abs(entDir)==2){
      if (yTop >= yStart+radius)
        entDir=-2;
      else if (yBottom <= yStart-radius)
        entDir=2;
      yTop+= entDir/2 * speed;
      yBottom+= entDir/2 * speed;
    }
     image(algaeFrames[(frameCount / 10) % 6], xLeft, yTop);
    //rect(xLeft, yTop, 100, 100);
  }
  void drawCircAlg(){
        fill(57, 255, 20);
        float xl = cx + cos(c1Ang)*c1Rad;
        float yt = cy + sin(c1Ang)*c1Rad;
        xLeft = xl;
        xRight = xl + 100;
        yTop = yt;
        yBottom = yt+100;
        image(algaeFrames[(frameCount / 10) % 6], xLeft, yTop);
//      rect(xLeft, yTop, 100, 100);
        c1Ang+=(PI/120);
  }
  boolean checkEntityCollision(String what) {
  //Checking collision of player and algae1
  if(what == "Player"){
    if ((type == "Algae" || type == "Circ")&&((c1.playerXRight>=xLeft && c1.playerXRight <= xRight) || (c1.playerXLeft >= xLeft && c1.playerXLeft <= xRight)) && (((c1.playerYBottom>=yTop) && (c1.playerYBottom<=yBottom)) || ((c1.playerYTop>=yTop) && (c1.playerYTop <= yBottom)))) {
      c1.hearts = c1.hearts-1;
      println("C1 Hearts: ", c1.hearts);
      alive = false;
      return true;
    }
    if (type == "Net"&&((c1.playerXRight>=xLeft && c1.playerXRight <= xRight) || (c1.playerXLeft >= xLeft && c1.playerXLeft <= xRight)) && (((c1.playerYBottom>=yTop) && (c1.playerYBottom<=yBottom)) || ((c1.playerYTop>=yTop) && (c1.playerYTop <= yBottom)))) {
      alive = false;
      Inventory[invCount] = new Item("Net");
      return true;
    }
  }
  else if (what == "Net"){
    if(c1.direction == 1){
      if((type == "Algae" || type == "Circ") && (((c1.playerXRight+40)>=xLeft && (c1.playerXRight+40) <= xRight) || ((c1.playerXLeft+90) >= xLeft && (c1.playerXLeft+90) <= xRight)) && (((c1.playerYBottom-42 >= yTop) && (c1.playerYBottom-42<=yBottom)) || ((c1.playerYTop+42>=yTop) && (c1.playerYTop+42 <=yBottom)))){
        alive = false;
      }
    }
    else
    {
      if((type == "Algae" || type == "Circ") && (((c1.playerXLeft-40)>=xLeft && (c1.playerXLeft-40) <= xRight) || ((c1.playerXLeft >= xLeft) && (c1.playerXLeft <= xRight))) && (((c1.playerYBottom-42 >= yTop) && (c1.playerYBottom-42<=yBottom)) || ((c1.playerYTop+42>=yTop) && (c1.playerYTop+42 <=yBottom)))){
      alive = false;
      }
    }
    
  }

  return false;
  }
  
  //float playerXLeft, playerXRight;
  //float playerYTop, playerYBottom;
}

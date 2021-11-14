public class character {
  //Creates the character's position, speed, and directional variables.
  float playerXLeft, playerXRight;
  float playerYTop, playerYBottom;
  float xspd, yspd;
  boolean L, R, U, D;
  boolean loaded;
  
  
  character(){ //Basic class constructor, initializes character position on screen.
    playerXLeft = 100;
    playerXRight = 150;
    playerYTop = 520;
    playerYBottom = 620;
  }
  
  //Moves the character based on an input of booleans from the KeyPressed function. Adding 'KeyReleased' later
  void move() {
    if (U && D || L && R) {
      //Do nothing! :D
    } else {
      if (U) {
        playerYTop -= 5; //Decreased speed from 10 to 5, worked a little fast when put into the draw function.
        playerYBottom -= 5;
      }
      if (D) {
        playerYTop += 5;    
        playerYBottom += 5;
      }
      if (L) {
        if (c1.playerXLeft <= 0) {
          if (mapVal != 0) {
            mapVal += 5;
            if(onLevel1){
                for (int i = 0; i < lvl1occ; i++) {
                  lvl1entities[i].xLeft += 5;
                  
                  //ADDED THE LINE BELOW TO FIX BUG
                  lvl1entities[i].xRight += 5;
                } 
            }
          }
        } else {
        playerXLeft-=5;
        playerXRight-=5;
        }
      }
      if (R) {
        if ((c1.playerXLeft +c1.playerXRight) / 2 >= (width / 2)) {
          mapVal-= 5;
          if(onLevel1){
                for (int i = 0; i < lvl1occ; i++) {
                  lvl1entities[i].xLeft -= 5;
                  
                  //ADDED THE LINE BELOW TO FIX BUG
                  lvl1entities[i].xRight -= 5;
                } 
          }
        } else {
          playerXLeft += 5;
          playerXRight += 5;
        }
      }
    }
  }
  
  void playerdraw(Boolean rg) { //Used for drawing the character sprite and the detection hitbox (in the shape of a rect)
    //scuba.resize(66,99);
    if(rg) { //Changes fill type for rectangle, red for detecting hits, green for normal.
      fill(255,0,0);
    } else {
      fill(0,255,0);
    }
    pushMatrix();
    scale(-1.0,1.0);
    image(scuba,-playerXRight,playerYTop);
    popMatrix();
  }
}

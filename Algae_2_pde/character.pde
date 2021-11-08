public class character {
  //Creates the character's position, speed, and directional variables.
  float playerXLeft, playerXRight;
  float playerYTop, playerYBottom;
  float xspd, yspd;
  boolean L, R, U, D;
  
  character(){ //Basic class constructor, initializes character position on screen.
    playerXLeft = 100;
    playerXRight = 150;
    playerYTop = 520;
    playerYBottom = 620;
  }
  
  //Moves the character based on an input of booleans from the KeyPressed function. Adding 'KeyReleased' later
  void move(boolean up, boolean down, boolean left, boolean right) {
    if (up) {
      playerYTop-=10;
      playerYBottom-=10;
    }
    if (down) {
      playerYTop+=10;    
      playerYBottom+=10;
    }
    if (left) {
      playerXLeft-=10;
      playerXRight-=10;
    }
    if (right) {
      playerXLeft+=10;
      playerXRight+=10;
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

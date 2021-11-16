public class character {
  //Creates the character's position, speed, and directional variables.
  float playerXLeft, playerXRight;
  float playerYTop, playerYBottom;
  boolean L, R, U, D;
  boolean loaded;
  boolean idling;
  boolean equippethed;
  int direction;
  
  character(){ //Basic class constructor, initializes character position on screen.
    playerXLeft = 100;
    playerXRight = 150;
    playerYTop = 520;
    playerYBottom = 620;
    direction = 0;
  }
  
  //Moves the character based on an input of booleans from the KeyPressed function. Adding 'KeyReleased' later
  void move() {
    if (U && D || L && R) {
      //Do nothing! :D
    } else {
      if (U && playerYTop >= 2) {
        playerYTop -= 5; //Decreased speed from 10 to 5, worked a little fast when put into the draw function.
        playerYBottom -= 5;
      }
      if (D && playerYBottom <= floorVal) {
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
                lvl1entities[i].cx += 5;
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
        if ((c1.playerXLeft +c1.playerXRight) / 2 >= (width / 2) && mapVal >= -stageLength) {
          mapVal-= 5;
          if(onLevel1){
            for (int i = 0; i < lvl1occ; i++) {
              lvl1entities[i].xLeft -= 5;
              lvl1entities[i].cx -= 5;
              //ADDED THE LINE BELOW TO FIX BUG
              lvl1entities[i].xRight -= 5;
          }
          }
        } else {
          if (playerXRight <= width) {
            playerXLeft += 5;
            playerXRight += 5;
          }
        }
      }
    }
    if (!U && !D && !L && !R) {
      idling = true;
    } else { idling = false; }
  }
  
  void playerdraw(Boolean rg) { //Used for drawing the character sprite and the detection hitbox (in the shape of a rect)
    //scuba.resize(66,99);
    if(rg) { //Changes fill type for rectangle, red for detecting hits, green for normal.
      fill(255,0,0);
    } else {
      fill(0,255,0);
    }
    println("Px: ", playerXLeft-mapVal, "Ptop: ", playerYTop);
    pushMatrix();
    if(c1.direction == -1){
      scale(-1.0,1.0);
      //if (idling) {
        if (equippethed) {
          image(charIdleNet[(frameCount / 10) % 8],-playerXLeft - 85,playerYTop);
          //image(idle[(frameCount/10)%10], 0, 0);
        } else {image(charIdle[(frameCount / 10) % 8],-playerXLeft - 75,playerYTop);}
      //} else {
      //  image(scuba,-playerXLeft - 50,playerYTop);
      //}
    }
    else {  
      //if (idling) {
        if (equippethed) {
          image(charIdleNet[(frameCount / 10) % 8],playerXLeft - 35,playerYTop);
          //image(idle[(frameCount/10)%10], 0, 0);
        } else {image(charIdle[(frameCount / 10) % 8],playerXLeft - 25,playerYTop);}
      //} else {
      //  image(scuba,playerXLeft,playerYTop);
      //}
    }
    popMatrix();
  }
  
  void Reset() {
    playerXLeft = 100;
    playerXRight = 150;
    playerYTop = 520;
    playerYBottom = 620;
    U = false;
    D = false;
    R = false;
    L = false;
  }
}

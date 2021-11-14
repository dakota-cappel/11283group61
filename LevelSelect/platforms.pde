public class platform{
  float left, right, top, bottom;
  float wide, high;
  
  platform(float _left, float _top, float _wide, float _high) { //No default, must use these parameters when making a new platform object.
    left = _left;
    top =_top;
    wide = _wide;
    high = _high;
    
    bottom = (top + high); //Calculated after the fact with the provided vars.
    right = (left + wide);
  }
  
  void drawPlatform() { //Updates the left and right variables when the map moves the platforms.
    left += mapVal;
    right = left + wide;
    rect(left, top, wide, high);
  }
  
  void checkCollisions() { //Collision checker! First part is the specific edge we're checking, the second is if the char is within the bounds of that side.
    if ((c1.playerYTop <= bottom && c1.playerYBottom >= bottom) && c1.playerXLeft <= right && c1.playerXRight >= left) {
      c1.U = false;
    } else if ((c1.playerYBottom >= top && c1.playerYTop <= top) && c1.playerXLeft <= right && c1.playerXRight >= left) {
      c1.D = false;
    } 
    if ((c1.playerXRight >= left && c1.playerXLeft <= left) && (c1.playerYTop <= bottom && c1.playerYBottom >= top)) {
      c1.R = false;
    } else if ((c1.playerXLeft <= right && c1.playerXRight >= right) && (c1.playerYTop <= bottom && c1.playerYBottom >= top)) {
      c1.L = false;
    }
  }
};

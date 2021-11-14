public class platform{
  float left, right, top, bottom;
  float wide, high;
  
  platform(float _left, float _top, float _wide, float _high) {
    left = _left;
    top =_top;
    wide = _wide;
    high = _high;
    
    bottom = (top + high);
    right = (left + wide);
  }
  
  void drawPlatform() {
    rect(left + mapVal, top, wide, high);
  }
  
  boolean checkCollisions() {
  
    return true;
  }
};

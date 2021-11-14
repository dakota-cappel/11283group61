void keyPressed() {
  if (c1.loaded) {
    if (key == 'w' || key == 'W') {
    c1.U = true;
  } else if (key == 's' || key == 'S') {     
    c1.D = true;
  } else if (key == 'd' || key == 'D') {
    c1.R = true;
    c1.direction = 1;
  } else if (key == 'a' || key == 'A') {
    c1.L = true;
    c1.direction = -1;
  }
    else if (key == '1') {
      if(equipped==1)
        equipped = 0;
      else
        equipped = 1;
  }
  else if (key == 'e') {
      if(equipped!=0)
        Inventory[equipped-1].use(Inventory[equipped-1].type);
  }
  }
}

void keyReleased() {
  if (c1.loaded) {
    if (key == 'w') {
    c1.U = false;
  } else if (key == 's') {     
    c1.D = false;
  } else if (key == 'd') {
    c1.R = false;
  } else if (key == 'a') {
    c1.L = false;
  }
  }
}

void mousePressed() {
  //if the display menu is shown
  if (onMenu == true) {
    //if "start" is selected
    if (startButton.MouseIsOver()) {
      print("Main Menu\n");
      startButton.drawClickedButton();
      //no longer on display
      onMenu = false;
      onLevelSelect = true;
    }

    //if "exit" is selected
    if (exitButton.MouseIsOver()) {
      print("Exiting\n");
      exitButton.drawClickedButton();
      //no longer on display screen
      onMenu = false;
      exit();
    }
  }
  if (onLevelSelect) {
    if (level1.MouseIsOver()) {
      level1.drawClickedButton();
      onLevelSelect = false;
      onLevel1 = true;
    }
    if (level2.MouseIsOver()) {
      level2.drawClickedButton();
      onLevelSelect = false;
      onLevel2 = true;
    }
    if (level3.MouseIsOver()) {
      level3.drawClickedButton();
      onLevelSelect = false;
      onLevel3 = true;
    }
    if (back.MouseIsOver()) {
      back.drawClickedButton();
      onLevelSelect = false;
      onMenu = true;
    }
  }
  if (onLevel1) {
    if (back.MouseIsOver()) {
      back.drawClickedButton();
      onLevel1 = false;
      onLevelSelect = true;
    }
    
  }
  if (onLevel2) {
    if (back.MouseIsOver()) {
      back.drawClickedButton();
      onLevel2 = false;
      onLevelSelect = true;
    }
    
  }
  if (onLevel3) {
    if (back.MouseIsOver()) {
      back.drawClickedButton();
      onLevel3 = false;
      onLevelSelect = true;
    }
    
  }
}

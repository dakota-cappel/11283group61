Button startButton = new Button();   //Start Button
Button exitButton = new Button();    //Exit Button
Button level1 = new Button();
Button level2 = new Button();
Button level3 = new Button();
Button back = new Button();
Button inventory = new Button();
character c1 = new character();

PImage bgrnd;
PImage scuba;
PImage logo;
PImage[] menu = new PImage[9];
PImage[] idle = new PImage[10];
float mapVal;
int currentFrame = 0;
int numFrames = 9;
PImage levelMap;
PFont title;

boolean onMenu;
boolean onLevelSelect;
boolean onLevel1;
boolean onLevel2;
boolean onLevel3;

entity[] lvl1entities = new entity[1000];
int lvl1occ = 0;
Item[] Inventory = new Item[3];
int invCount = 0;

void setup() {
  size(1280, 720);
  float startX = width/11 - 50;
  float startY = height/4;
  float exitX = width/11 - 50;
  float exitY = height/4 + 100;
  
  mapVal = 0;
  bgrnd = loadImage("Background.png");
  scuba = loadImage("Scuba.png");
  
  onMenu = true;
  onLevelSelect = false;
  onLevel1 = false;
  onLevel2 = false;
  onLevel3 = false;
  c1.loaded = false;
  
  title = createFont("titleText.ttf", 32); 
  textFont(title);
  
  for(int i = 1; i <= 9; i++){
    menu[i-1] = loadImage("MainMenuF" + i + ".png");
  }
  for(int i = 1; i <= 10; i++){
    idle[i-1] = loadImage("Idle" + i + ".png");
  }


  levelMap = loadImage("LevelSelect.png");
  logo = loadImage("Logo.png");
  startButton = new Button("START", startX, startY, width/3, height/10);
  exitButton = new Button("EXIT", exitX, exitY, width/3, height/10);
  back = new Button("BACK", 20, 20, 60, 50);
  inventory = new Button("INV.", 1210, 20, 60, 50);
  level1 = new Button("1", 750, 110, 100, 50);
  level2 = new Button("2", 900, 400, 100, 50);
  level3 = new Button("3", 1000, 630, 100, 50);
  
  //Declaring Level 1 Entities
  entity alg1 = new entity("Algae", 275, 370, 100, 100, 2, 3);
  lvl1entities[lvl1occ] = alg1;
  lvl1occ+=1;
  entity net = new entity("Net", 600, 590, 40, 15, 1, 1);
  lvl1entities[lvl1occ] = net;
  lvl1occ+=1;
  entity alg2 = new entity("Algae", 700, 300, 100, 100, -1, 3);
  lvl1entities[lvl1occ] = alg2;
  lvl1occ+=1; 

}

void draw() {
  background(255);
  
  if (onMenu) {
    //currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    //image(menu[(currentFrame) % numFrames], 5, 0);    
    image(menu[(frameCount/10)%9], 0, 0);
    
    pushMatrix();
    for(int i = 1; i <=10; i++){
      translate(idle[i-1].width, 0);
    }
    scale(-1, 1);
    image(idle[(frameCount/10)%10], 0, 0);
    popMatrix();
    
    //pushMatrix();
    //logo.resize(500, 500);
    //image(logo, 0, -70);
    //popMatrix();
    displayMenu();
  } 
  else if (onLevelSelect) {
    displayLevelSelect();
    if (level1.MouseIsOver()) {
      level1.drawActiveButton();
    } else {
      level1.drawButton();
    }
    if (level2.MouseIsOver()) {
      level2.drawActiveButton();
    } else {
      level2.drawButton();
    }
    if (level3.MouseIsOver()) {
      level3.drawActiveButton();
    } else {
      level3.drawButton();
    }
    if (back.MouseIsOver()) {
      back.drawActiveButton();
    } else {
      back.drawButton();
    }
  }
  else if (onLevel1) {
    displayLevel1();
  }
  else if (onLevel2) {
    displayLevel2();
  }
  else if (onLevel3) {
    displayLevel3();
  }
}

void displayMenu() {  
  c1.loaded = false;
  //draw start button
  startButton.drawButton();
  if (startButton.MouseIsOver()) {
    startButton.drawActiveButton();
  }
  //draws exit button
  exitButton.drawButton();
  if (exitButton.MouseIsOver()) {
    exitButton.drawActiveButton();
  }
}

void displayLevelSelect() {
  c1.loaded = false;
  image(levelMap, 5, 0);
}

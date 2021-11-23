import processing.sound.*;

Button startButton = new Button();   //Start Button
Button exitButton = new Button();    //Exit Button
Button level1 = new Button();
Button level2 = new Button();
Button level3 = new Button();
Button back = new Button();
Button inventory = new Button();
character c1 = new character();

boolean gg;
PImage bgrnd;
PImage scuba;
PImage logo;
PImage ground;
PImage platform;
PImage net;
PImage heart;
PImage[] menu = new PImage[9];
PImage[] idle = new PImage[10];
PImage[] charIdle = new PImage[8];
PImage[] charIdleNet = new PImage[8];
PImage[] algaeFrames = new PImage[6];
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
int equipped;
float c1Ang;
float c1Rad;
int score;

void setup() {
  gg = false;
  score =0;
  size(1280, 720);
  float startX = width/11 - 50;
  float startY = height/4;
  float exitX = width/11 - 50;
  float exitY = height/4 + 100;
  
  mapVal = 0;
  backVal = 0;
  bgrnd = loadImage("stage1.png");
  scuba = loadImage("scuba/Scuba.png");
  ground = loadImage("ground.png");
  platform = loadImage("Platform.png");
  net = loadImage("net.png");
  net.resize(40,0);
  heart = loadImage("Heart.png");
  
  onMenu = true;
  onLevelSelect = false;
  onLevel1 = false;
  onLevel2 = false;
  onLevel3 = false;
  c1.loaded = false;
  
  title = createFont("titleText.ttf", 32); 
  textFont(title);
  
  for(int i = 1; i <= 9; i++){
    menu[i-1] = loadImage("Main Menu/MainMenuF" + i + ".png");
  }
  for(int i = 1; i <= 10; i++){
    idle[i-1] = loadImage("joshidle/Idle" + i + ".png");
  }
  for (int i = 0; i < charIdle.length; i++) {
    charIdle[i] = loadImage("IDLE/idle-" + (i + 1) + ".png");
  }
  for (int i = 0; i < charIdle.length; i++) {
    charIdleNet[i] = loadImage("IDLE_NET/idle_with_net-" + (i + 1) + ".png");
  }
  for (int i = 1; i < 7; i++) {
    algaeFrames[i-1] = loadImage("Algae/Alg" + i + ".png");
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
  entity alg1 = new entity("Algae", 275, 370, 100, 100, 2, 3, 100,0,0);
  lvl1entities[lvl1occ] = alg1;
  lvl1occ+=1;
  entity net = new entity("Net", 600, 590, 40, 15, 1, 1, 0,0,0);
  lvl1entities[lvl1occ] = net;
  lvl1occ+=1;
  entity alg2 = new entity("Algae", 700, 300, 100, 100, -1, 3, 300,0,0);
  lvl1entities[lvl1occ] = alg2;
  lvl1occ+=1;
  entity alg3 = new entity("Algae", 1025, 300, 100, 100, 2, 3, 100,0,0);
  lvl1entities[lvl1occ] = alg3;
  lvl1occ+=1;
  entity alg = new entity("Algae", 760, 125, 100, 100, 2, 3, 50,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 1300, 250, 100, 100, 2, 3, 150,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 2000, 255, 100, 100, 1, 3, 400,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 2200, 500, 100, 100, -1, 3, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 1800, 500, 100, 100, 1, 3, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 1900, 425, 100, 100, 2, 3, 100,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 2430, 175, 100, 100, 2, 3, 125,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 2475, 450, 100, 100, -2, 3, 100,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 2800, 235, 100, 100, 1, 3, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 3150, 300, 100, 100, -2, 3, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 3725, 300, 100, 100, 2, 4, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 3925, 300, 100, 100, -2, 3, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 4125, 280, 100, 100, 2, 4, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 3980, 550, 100, 100, -1, 3, 225,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;

  alg = new entity("Circ", 3000, 120, 100, 100, -2, 3, 100, 3200, 320);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  float dX = 200 - 100;
  float dY = 360 - 160;
  c1Ang = atan2(dX,dY);
  c1Rad = dist(3000,320,3200,120);
  
  alg = new entity("Algae", 4430, 490, 100, 100, 2, 3, 150,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 4650, 150, 100, 100, 1, 3, 250,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 4850, 350, 100, 100, -1, 3, 250,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 4800, 500, 100, 100, 1, 3, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 5110, 120, 100, 100, -2, 3, 40,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 5410, 300, 100, 100, 2, 3, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 5850, 525, 100, 100, 1, 3, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;
  alg = new entity("Algae", 5850, 360, 100, 100, -1, 4, 190,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 5850, 40, 100, 100, 1, 4, 170,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 6100, 230, 100, 100, -2, 4, 180,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 6225, 410, 100, 100, 2, 3, 180,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 6400, 230, 100, 100, 2, 4, 180,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 6240, 500, 100, 100, 1, 3, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 6240, 300, 100, 100, -1, 4, 200,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 6660, 250, 100, 100, -2, 4, 180,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 6660, 490, 100, 100, 1, 4, 220,0,0);
  lvl1entities[lvl1occ] = alg;
  lvl1occ+=1;  
  alg = new entity("Algae", 6850, 240, 100, 100, 2, 3, 170,0,0);
  lvl1entities[lvl1occ] = alg;
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
    //Check if player died
    if(c1.hearts==0)
      resetLvl1();
    
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
  textSize(45);
  fill(0);
  text("TO BEAT EACH LEVEL REACH THE\n END WITH A SCORE OF 250. EACH ALGAE IS \n WORTH 10 POINTS", 369,420);
}

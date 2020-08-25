int antalBolde = 10;
Bold[] bolde = new Bold[antalBolde];
float gravity = 0.3;
float friction = -0.9;
boolean warning;
PImage background;
//###################################################################################################################
//##############ADVARSEL DETTE PROGRAM INDEHOLDER KRAFTIG LYS SOM KAN PÅVIRKE SÆRLIGT FØLSOMME PERSONER##############
//###################################################################################################################

void setup() {
  size(800, 800);
  if (!warning) {
    textSize(20);
    fill(0);
    text("ADVARSEL DETTE PROGRAM INDEHOLDER KRAFTIG LYS", 10, 30);
    text("SOM KAN PÅVIRKE SÆRLIGT FØLSOMME PERSONER", 10, 60);
    textSize(15);
    text("Ved klik på en hvilken som helst tast på tastaturet kan du genstarte dette program", 10, 90);
    delay(10000);
    warning = true;
  } 
  for (int i = 0; i < antalBolde; i++) {
    bolde[i] = new Bold(random(width), random(700), 20, i, bolde, 5, gravity, friction, antalBolde);
  }
  imageMode(CENTER);
  background = loadImage("disko.png");
}

void draw() {
  background(255);
  image(background, 400, 125, 400, 400);

  for (int i = 0; i < antalBolde; i++) {
    //Udkommenter følgende kode for at fjerne skarpt rainbow lys
    fill(random(255), random(255), random(255));
    bolde[i].displayCircle();
  }

  for (Bold bold : bolde) {
    bold.displayCircle();
    bold.move();
    bold.collideBalls();
    bold.collideWall();
    bold.displayRect();
    bold.collideFloor();
  }
}


void keyPressed() {
  frameCount = -1;
}

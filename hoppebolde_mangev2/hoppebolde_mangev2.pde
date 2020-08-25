int antalBolde = 10;
Bold[] bolde = new Bold[antalBolde];
float gravity = 0.3;
float friction = -0.9;
PImage background;
//###################################################################################################################
//##############ADVARSEL DETTE PROGRAM INDEHOLDER KRAFTIG LYS SOM KAN PÅVIRKE SÆRLIGT FØLSOMME PERSONER##############
//###################################################################################################################


void setup() {
  size(800, 800);
  

  //Her gør programmet plads til alle elipserne
  for (int i = 0; i < antalBolde; i++) {
    bolde[i] = new Bold(random(width), random(700), 20, i, bolde, 5, gravity, friction, antalBolde);
  }
  //Loader discokugle billedet
  imageMode(CENTER);
  background = loadImage("disko.png");
}

void draw() {
  background(255);
 
  //Vi starer programmet ud med at give brugeren en advarsel siden vores program godt kan trigger epilepsi, vi har valgt at gøre det her ved hjælp af en startskærm som vi har lavet bag et if statement som siger at hvis warning er falsk og frame counten er under 300 så køre den. 
  if (frameCount < 300 ) {
    textSize(20);
    fill(0);
    text("ADVARSEL DETTE PROGRAM INDEHOLDER KRAFTIG LYS", 10, 30);
    text("SOM KAN PÅVIRKE SÆRLIGT FØLSOMME PERSONER", 10, 60);
    textSize(15);
    text("Ved klik på en hvilken som helst tast på tastaturet kan du genstarte dette program", 10, 90);
<<<<<<< HEAD
    //delay(10000);
    println(frameCount);
  } else{
  //Tegner discokuglen
  image(background, 400, 125, 400, 400);

//Tegner boldene
  for (int i = 0; i < antalBolde; i++) {
    //Udkommenter følgende kode for at fjerne skarpt rainbow lys
    fill(random(255), random(255), random(255));
    bolde[i].displayCircle();
  }

  //Et loop som køre alle boldenes funktioner
  for (Bold bold : bolde) {
    bold.displayCircle();
    bold.move();
    bold.collideBalls();
    bold.collideWall();
    bold.displayRect();
    bold.collideFloor();
  }
}
}

//Når man klikker på en knap bliver frameCounten sat til -1 vi bruger det til at genstarte programmet  
void keyPressed() {
  frameCount = -1;
}

int antalBolde = 72;
float gravity = 0.3;
float friction = -0.7;
Bold[] bolde = new Bold[antalBolde];


void setup() {
  size(800, 800);

  for (int i = 0; i < antalBolde; i++) {
    bolde[i] = new Bold(random(width), random(height), 20, i, bolde, 5, gravity, friction, antalBolde);
  }
}

void draw() {
  background(0);

  for(Bold bold : bolde){
    bold.display();
    bold.move();
    bold.collide();
    bold.collideWall();
  }


}

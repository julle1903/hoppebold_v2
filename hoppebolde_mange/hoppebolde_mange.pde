Bold bold[];
int antalBolde = 72;
float gravity = 0.3;
PVector friction = new PVector(0,0);
  
  
void setup() {
  size(800, 800);
  
  for (int i = 0; i < antalBolde; i++) {
    bold[i] = new Bold(random(width), random(height), 20, i, bold, 5, gravity);
  }
}

void draw() {
  background(0);
  

  
}

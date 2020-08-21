class Bold {
  
  PVector pos;
  float size;
  float velX, velY;
  float acc;
  float gravity;

 
  Bold(float tempX, float tempY, float tempDia, float tempId, Bold[] tempBolde, float tempAcc, float tempGravity) {
    pos = new PVector(tempX,tempY);
    size = tempDia;
    velX = 0;
    velY = 0;
    acc = tempAcc;
    gravity = tempGravity;
  } 
  
  void move() {
    velY += gravity;
    pos.x += velX;
    pos.y += velY;

  }
  
  void collideCornor() {
    if (pos.x < width) {
      pos.x *= -acc;
      
    }
  }
  
  void collide() {
    if(1==1) {
    }
  }
  

  
  void display() {

  }
}

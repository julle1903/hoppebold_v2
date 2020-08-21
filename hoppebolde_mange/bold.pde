class Bold {
  
  PVector pos;
  float size;
  float velX, velY;
  float acc;
  float gravity;
  float id;
  Bold[] andreBolde;
 
  Bold(float tempX, float tempY, float tempDia, float tempId, Bold[] tempBolde, float tempAcc, float tempGravity) {
    pos = new PVector(tempX,tempY);
    size = tempDia;
    velX = 0;
    velY = 0;
    acc = tempAcc;
    gravity = tempGravity;
    id = tempId;
    andreBolde = tempBolde;
    
  } 
  
  void move() {
    velY += gravity;
    pos.x += velX;
    pos.y += velY;

  }
  
  void collideWall() {
    if (pos.x + size/2 < width) {
      pos.x *= -acc;
      
    }
        if (pos.y + size/2 < height) {
      pos.y *= -acc;
      
    }
  }
  
  void collide() {
    if(1==1) {
    }
  }
  

  
  void display() {
    ellipse(pos.x,pos.y,size,size); 
  }
}


class Bold {

  PVector pos;
  float size;
  float velX, velY;
  float acc;
  float gravity;
  float friction;
  int id;
  Bold[] andreBolde;
  int antalBolde;
 
  Bold(float tempX, float tempY, float tempDia, int tempId, Bold[] tempBolde, float tempAcc, float tempGravity, float tempFriction, int tempAntalBolde) {
    pos = new PVector(tempX,tempY);
    size = tempDia;
    velX = 0;
    velY = 0;
    acc = tempAcc;
    gravity = tempGravity;
    id = tempId;
    andreBolde = tempBolde;
    friction = tempFriction;
    antalBolde = tempAntalBolde;
  } 

  void move() {
    velY += gravity;
    pos.x += velX;
    pos.y += velY;

  }

  void collideWall() {
      if (pos.x + size/2 > width) {
        pos.x = width - size/2;
        velX *= friction; 
      } else if (pos.x - size/2 < 0) {
        pos.x = size/2;
        velX *= friction;
      }

      if (pos.y + size/2 > height) {
        pos.y = height - size/2;
        velY *= friction; 
      } else if (pos.y - size/2 < 0) {
        pos.y = size/2;
        velY *= friction;
      }
  }
  
  void collideFloor() {
    
  }

  void collide() {
    for (int i = id + 1; i < antalBolde; i++) {
      float distance = dist(andreBolde[i].pos.x, andreBolde[i].pos.y, pos.x, pos.y);
      if (distance < andreBolde[i].size/2 + size/2) {
        println("collide");
      }
    }
  }



  void display() {
    ellipse(pos.x,pos.y,size,size); 
  }
}

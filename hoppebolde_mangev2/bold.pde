
class Bold {

  PVector pos, r1Pos, r2Pos, r3Pos, r4Pos, r1Size, r2Size, r3Size, r4Size;
  float size;
  float velX, velY;
  float acc;
  float gravity;
  float friction;
  int id;
  float CX, CY, CW, CH; 

  Bold[] andreBolde;
  int antalBolde;

  Bold(float tempX, float tempY, float tempDia, int tempId, Bold[] tempBolde, float tempAcc, float tempGravity, float tempFriction, int tempAntalBolde) {
    pos = new PVector(tempX, tempY);
    r1Pos = new PVector(0, height-40);
    r1Size = new PVector(200, 40);
    r2Pos = new PVector(200, height-80);
    r2Size = new PVector(200, 80);
    r3Pos = new PVector(400, height-60);
    r3Size = new PVector(200, 60);
    r4Pos = new PVector(600, height-20);
    r4Size = new PVector(200, 20);
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
    for (int i = id; i < antalBolde; i++) {
      for (int j = 0; j < 4; j++) {
        if (j == 0) {
          CX = r1Pos.x;
          CY = r1Pos.y;
          CW = r1Size.x;
          CH = r1Size.y;
        } else if (j == 1) {
          CX = r2Pos.x;
          CY = r2Pos.y;
          CW = r2Size.x;
          CH = r2Size.y;
        } else if (j == 2) {
          CX = r3Pos.x;
          CY = r3Pos.y;
          CW = r3Size.x;
          CH = r3Size.y;
        } else if (j == 3) {
          CX = r4Pos.x;
          CY = r4Pos.y;
          CW = r4Size.x;
          CH = r4Size.y;
        } 
        float testX = pos.x;
        float testY = pos.y;
        if (pos.x + size/2 < CX) {
          testX = CX;
        } else if (pos.x + size/2 > CX+CW) {
          testX = CX+CW;
        }
        if (pos.y +size/2 < CY) {
          testY = CY;
        }

        float distX = pos.x-testX;
        float distY = pos.y-testY;
        float distance = sqrt( (distX*distX) + (distY*distY) );

        if (distance <= size/2) {
          
          pos.y = height - (size/2+CH+0.0001);
          velY *= friction;
        }
      }
    }
  }

  void collideBalls() {
    for (int i = id + 1; i < antalBolde; i++) {
      float distance = dist(andreBolde[i].pos.x, andreBolde[i].pos.y, pos.x, pos.y);
      if (distance < andreBolde[i].size/2 + size/2) {
        float X = pos.x + 2.5 * andreBolde[i].size/2 + size/2;
        float Y = pos.y + 2.5 * andreBolde[i].size/2 + size/2;
        float ax = (X - andreBolde[i].pos.x) * 0.05;
        float ay = (Y - andreBolde[i].pos.y) * 0.05;
        velX -= ax;
        velY -= ay;
        andreBolde[i].velX += ax;
        andreBolde[i].velY += ay;
      }
    }
  }




  void displayCircle() {
    ellipse(pos.x, pos.y, size, size);
  }
  void displayRect() {      
    stroke(random(255),random(255),random(255));
    rect(r1Pos.x, r1Pos.y, r1Size.x, r1Size.y);
    rect(r2Pos.x, r2Pos.y, r2Size.x, r2Size.y);
    rect(r3Pos.x, r3Pos.y, r3Size.x, r3Size.y);
    rect(r4Pos.x, r4Pos.y, r4Size.x, r4Size.y);}

}

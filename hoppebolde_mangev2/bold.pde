
class Bold {

  PVector position, rect1Position, rect2Position, rect3Position, rect4Position, rect1Size, rect2Size, rect3Size, rect4Size;
  float size;
  float velocityX, velocityY;
  float acceleration;
  float gravity;
  float friction;
  int id;
  float currentRectX, currentRectY, currentRectW, currentRectH; 

  Bold[] andreBolde;
  int antalBolde;

  Bold(float tempX, float tempY, float tempDia, int tempId, Bold[] tempBolde, float tempAcceleration, float tempGravity, float tempFriction, int tempAntalBolde) {
    position = new PVector(tempX, tempY);
    rect1Position = new PVector(0, height-40);
    rect1Size = new PVector(200, 40);
    rect2Position = new PVector(200, height-80);
    rect2Size = new PVector(200, 80);
    rect3Position = new PVector(400, height-60);
    rect3Size = new PVector(200, 60);
    rect4Position = new PVector(600, height-20);
    rect4Size = new PVector(200, 20);
    size = tempDia;
    velocityX = 0;
    velocityY = 0;
    acceleration = tempAcceleration;
    gravity = tempGravity;
    id = tempId;
    andreBolde = tempBolde;
    friction = tempFriction;
    antalBolde = tempAntalBolde;
  } 

  void move() {
    velocityY += gravity;
    position.x += velocityX;
    position.y += velocityY;
  }

  void collideWall() {
    if (position.x + size/2 > width) {
      position.x = width - size/2;
      velocityX *= friction;
    } else if (position.x - size/2 < 0) {
      position.x = size/2;
      velocityX *= friction;
    }

    if (position.y + size/2 > height) {
      position.y = height - size/2;
      velocityY *= friction;
    } else if (position.y - size/2 < 0) {
      position.y = size/2;
      velocityY *= friction;
    }
  }

  void collideFloor() {
    for (int i = id; i < antalBolde; i++) {
      for (int j = 0; j < 4; j++) {
        if (j == 0) {
          currentRectX = rect1Position.x;
          currentRectY = rect1Position.y;
          currentRectW = rect1Size.x;
          currentRectH = rect1Size.y;
        } else if (j == 1) {
          currentRectX = rect2Position.x;
          currentRectY = rect2Position.y;
          currentRectW = rect2Size.x;
          currentRectH = rect2Size.y;
        } else if (j == 2) {
          currentRectX = rect3Position.x;
          currentRectY = rect3Position.y;
          currentRectW = rect3Size.x;
          currentRectH = rect3Size.y;
        } else if (j == 3) {
          currentRectX = rect4Position.x;
          currentRectY = rect4Position.y;
          currentRectW = rect4Size.x;
          currentRectH = rect4Size.y;
        } 
        float testX = position.x;
        float testY = position.y;
        if (position.x + size/2 < currentRectX) {
          testX = currentRectX;
        } else if (position.x + size/2 > currentRectX+currentRectW) {
          testX = currentRectX+currentRectW;
        }
        if (position.y +size/2 < currentRectY) {
          testY = currentRectY;
        }

        float distX = position.x-testX;
        float distY = position.y-testY;
        float distance = sqrt( (distX*distX) + (distY*distY) );

        if (distance <= size/2) {
          position.y = height - (size/2+currentRectH+0.0001);
          velocityY *= friction;
        }
      }
    }
  }

  void collideBalls() {
    for (int i = id + 1; i < antalBolde; i++) {
      float distance = dist(andreBolde[i].position.x, andreBolde[i].position.y, position.x, position.y);
      if (distance < andreBolde[i].size/2 + size/2) {
        float X = position.x + 2.5 * andreBolde[i].size/2 + size/2;
        float Y = position.y + 2.5 * andreBolde[i].size/2 + size/2;
        float ax = (X - andreBolde[i].position.x) * 0.05;
        float ay = (Y - andreBolde[i].position.y) * 0.05;
        velocityX -= ax;
        velocityY -= ay;
        andreBolde[i].velocityX += ax;
        andreBolde[i].velocityY += ay;
      }
    }
  }

  void displayCircle() {
    ellipse(position.x, position.y, size, size);
  }
  void displayRect() {      
    stroke(random(255),random(255),random(255));
    rect(rect1Position.x, rect1Position.y, rect1Size.x, rect1Size.y);
    rect(rect2Position.x, rect2Position.y, rect2Size.x, rect2Size.y);
    rect(rect3Position.x, rect3Position.y, rect3Size.x, rect3Size.y);
    rect(rect4Position.x, rect4Position.y, rect4Size.x, rect4Size.y);}

}

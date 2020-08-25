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
    //Gulvet
    rect1Position = new PVector(0, height-40);
    rect1Size = new PVector(200, 40);
    rect2Position = new PVector(200, height-80);
    rect2Size = new PVector(200, 80);
    rect3Position = new PVector(400, height-60);
    rect3Size = new PVector(200, 60);
    rect4Position = new PVector(600, height-20);
    rect4Size = new PVector(200, 20);
    //size er diameteren på elipsen
    size = tempDia;
    //velocity er farten på vores elipser
    velocityX = 0;
    velocityY = 0;
    //friction, acceleration og gravity påvirker vores velocity
    acceleration = tempAcceleration;
    gravity = tempGravity;
    friction = tempFriction;
    //id er boldens tal, som den får første gang man loader ind
    id = tempId;
    andreBolde = tempBolde;
    antalBolde = tempAntalBolde;
  } 
//Vi bruger void move til at ændre vores elipsers placering, vi gør det ved at vi hele tiden ændre deres position x og y med vores velocity, grunden til at vi skriver "position.x/position.y" er fordi vi har med vectore og gøre
  void move() {
    velocityY += gravity;
    position.x += velocityX;
    position.y += velocityY;
  }
//Her under er vores collideWall funktion, den gør som navnet siger. Måden den dog gør det på er ved at hele tiden checke om en bolds x eller y rammer en side. Vi gør det her ved at bruge et if statement som siger at hvis boldens x +½ af dens størelse er større end vinduets bredde så har den ramt og skal skifte retning
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
//collideFloor var dog lidt tricky. Først køre den alle bolde igennem, derefter alle firkanterne. Derefter i vores if statement sætter vi firkanternes værdi til det rigtige så vi kan bruge dem længere nede (linje 86,88,91).  
//Når vi så kommer ned til det næste if statement (linje 86) så begynder vi at bruge firkanterne de rammer til noget. Måden vi ser om de kolliderer er ved at checke om distancen er mindre end size/2 og hvis den er mindre så må det betyde at de har ramt, og så ændre vi på deres velocityY for at få dem til at hoppe
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

//collideBalls starter med at loade alle andre bolde ind i sig selv, så køre vi et if statement som checker om selve bolden rammer en anden, det gør vi ved at kigge på distancen mellem boldene. Når boldene så rammer hinanden bliver de skudt i modsatte retninger for at gøre det realistisk.
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

//Her er tegne funktionen for cirklerne
  void displayCircle() {
    ellipse(position.x, position.y, size, size);
  }
  //Her tegner vi vores gulv
  void displayRect() {      
    stroke(random(255),random(255),random(255));
    rect(rect1Position.x, rect1Position.y, rect1Size.x, rect1Size.y);
    rect(rect2Position.x, rect2Position.y, rect2Size.x, rect2Size.y);
    rect(rect3Position.x, rect3Position.y, rect3Size.x, rect3Size.y);
    rect(rect4Position.x, rect4Position.y, rect4Size.x, rect4Size.y);}

}

class Rocket {
  // attributter
  int diameter = 10; // diameter

  PVector pos;
  float angle = random(radians(-30), radians(30)); // Begræns vinklen til mellem -30 og 30 grader

  float xSpeed = random(0.8, 1.5); // Tilfældig vandret hastighed
  float ySpeed = random (-2.2, -1.6); // lodret hastighed som skal tilpasses skærmstørrelsen
  PVector velocity = new PVector(xSpeed, ySpeed);

  // farver til eksplosion RGB og opauqe værdi alfa
  int r=int(random(256));
  int g=int(random(256));
  int b=int(random(256));
  int alpha=255;

  //PVector velocity = new PVector(cos(angle), -2 + sin(angle));
  float minHeight = height-(height/4); // Minimumshøjde
  boolean exploded = false;

  // lyd
  boolean soundPayed = false; // bruges til lyd

  // konstruktør
  Rocket() {
    pos = new PVector(random(40, 120), height); // Startposition tilfældigt langs bunden
  }

  // metoder
  void playExplodingSound() {
    if (!soundPayed ) {
      singleRocket.play();
      soundPayed = true;
    }
  }

  void display() {
    if (!exploded) {
      circle(pos.x, pos.y, diameter);
    } else {
      playExplodingSound(); // afspil lyd

      
      explode(); // Tegn eksplosion i nedarvningen!
      
      
    }
  }

  void move() {
    // for at variere højden
    float yspeed = random(0.001, 0.01);
    float xspeed = random(0.0001, 0.005); // Begræns den vandrette hastighed

    if (!exploded) {

      pos.add(velocity);
      velocity.y += yspeed;
      velocity.x += xspeed;
      checkExplosion();
    }
  }

  void checkExplosion() {
    // Tjek om raketten er på vej nedad og har nået minimumshøjden
    if ((velocity.y > 0 || pos.x > width - 20 || pos.x < 20) && pos.y < minHeight) {
      exploded = true;
    }
  }

  void explode() {} // metode til overwirte
   
  
}


/**********************************************/

class MyRocket extends Rocket{
    @Override
      void explode() {
        diameter += 2;
        alpha -= 10;
        noStroke();
        for (int i = 0; i < 6; i++) {
            fill(random(255), random(255), random(255), alpha);
            pushMatrix();
            translate(pos.x, pos.y);
            rotate(frameCount * 0.1 + i * PI / 3);
            triangle(0, -diameter, -diameter / 2, diameter, diameter / 2, diameter);
            popMatrix();
        }
    }
}

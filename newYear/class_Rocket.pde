class Rocket {
  // attributter
  int diameter = 5; // diameter

  PVector pos;
  float angle = random(radians(-30), radians(30)); // Begræns vinklen til mellem -30 og 30 grader

  float xSpeed = random(0.05, 1.5); // Tilfældig vandret hastighed
  float ySpeed = random (-2.8, -1.5); // lodret hastighed som skal tilpasses skærmstørrelsen
  PVector velocity = new PVector(xSpeed, ySpeed);

  // farver til eksplosion RGB og opauqe værdi alpha
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
    pos = new PVector(random(600, 600), height); // Startposition tilfældigt langs bunden
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
    float yspeed = random(0.0001, 0.01);
    float xspeed = random(0.00001, 0.0005); // Begræns den vandrette hastighed

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

class oliv178e extends Rocket {
  float pulsDiameter = 0; // diameter for hvid cirkel
  boolean stor = true; // bruges til at styre pulsen

  @Override
  void explode() {
    // gul cirkel
    fill(255, 250, 0, alpha);
    ellipse(pos.x, pos.y, diameter * 2, diameter * 2);

    // hvid cirkel
    fill(255, 255, 255, alpha); // White with the same transparency as the yellow
    ellipse(pos.x, pos.y, pulsDiameter, pulsDiameter);

    // fade og ingen kant ting
    diameter++;
    alpha -= 4;
    noStroke();

    // puls
    if (stor) {
      pulsDiameter += 2;
      if (pulsDiameter > diameter * 1.0) { // begræns størrles
        stor = false;
      }
    } else {
      pulsDiameter -= 2;
      if (pulsDiameter < diameter * 1.2) { // minimum størrels
        stor = true;
      }
    }
  }
}

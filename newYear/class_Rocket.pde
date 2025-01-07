class Rocket {
  // attributter
  PVector pos;
  float angle = random(0, 2);
  PVector velocity = new PVector(angle, -2);
  boolean exploded = false;

  // konstruktør
  Rocket() {
    pos = new PVector(random(width), height); // Startposition tilfældigt langs bunden
  }

  // metoder

  void display() {
    int diameter = 10;
    if (!exploded) {
      circle(pos.x, pos.y, diameter);
    } else {
      // Tegn eksplosion (du kan tilpasse dette)
      fill(255, 0, 0);
      ellipse(pos.x, pos.y, diameter * 2, diameter * 2);
    }
  }

  void move() {
    // for at variere højden
    float yspeed = random(0.0001, 0.01);
    float xspeed = random(0.0001, 0.01);
    if (!exploded) {
      pos.add(velocity);
      velocity.y += yspeed;
      velocity.x += xspeed;
      checkExplosion();
    }
  }

  void checkExplosion() {
    // Tjek om raketten er på vej nedad
    if (velocity.y > 0 || pos.x > width - 20) {
      explode();
    }
  }

  void explode() {
    exploded = true;
    // Tilføj eventuelle yderligere eksplosionseffekter her
  }
}

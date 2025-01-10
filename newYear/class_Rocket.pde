class Rocket {
  // attributter
  int diameter = 10; // diameter
  
  int expR = (int) random(0, 256); // random RGB farvekoder for hver eksplosion/raket.
  int expG = (int) random(0, 256);
  int expB = (int) random(0, 256);
  int alfa=255;
  
  PVector pos;
  float angle = random(radians(-30), radians(30)); // Begræns vinklen til mellem -30 og 30 grader

  float xSpeed = random(0.05, 1.5); // Tilfældig vandret hastighed
  float ySpeed = random (-2.8, -1.5); // lodret hastighed som skal tilpasses skærmstørrelsen
  PVector velocity = new PVector(xSpeed, ySpeed);

  //PVector velocity = new PVector(cos(angle), -2 + sin(angle));
  float minHeight = height-(height/4); // Minimumshøjde
  boolean exploded = false;

  // lyd
  boolean soundPayed = false; // bruges til lyd

  // konstruktør
  Rocket() {
    pos = new PVector(random(10, 400), height); // Startposition tilfældigt langs bunden
          // Ændrede på intervallet, da jeg gerne vil have at raketterne er lidt mere spredt ud.
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
    } 
    else {
      playExplodingSound(); // afspil lyd
      explode(6); // Tegn eksplosion i nedarvningen!
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

  void explode(int nParticles) // Koden udføres kun hvis jeg putter det i den her funktion, så jeg ved ikke helt hvorfor du skrev at vi skal skrive det i override funktionen...
  {
      ExplodeParticle[] particles = new ExplodeParticle[nParticles];
     for(int i = 0; i < particles.length; i++) 
     {
       particles[i] = new ExplodeParticle(); // her initiere jeg hver af de 6 partikler for en eksplosion.
     }
    fill(expR, expG, expB, alfa); 
    ellipse(pos.x, pos.y, diameter * 2, diameter * 2);
    ellipse(pos.x, pos.y, diameter * 1.3, diameter * 1.3); // Tilføjede endnu en ring til eksplosionen, for at det ligner lydbølger på en måde.
    diameter++; // inkrementere værdien af diameter med 1
    alfa -= 3; // dekrementere værdien af alfa med 3 (jeg valgte 3 fordi jeg syntes at det varede for lang tid)
    for(int k = 0; k < 6; k++) 
    {
      float rndX = random(-30, 31);
      float rndY = random(-30, 31);
      particles[k].displayParticle(rndX + pos.x, rndY + pos.y); // Og nu tegner jeg hver partikel, med en tilfældig placering rundt om eksplosionen.
                                     // det er vigtigt at have "+ pos.x" og "+ pos.y", for at sørge for at partiklerne er placeret rundt om den specfikke eksplosion.
    } 
  } // metode til overwirte
}


/**********************************************/

class MyRocket extends Rocket{ // TBH, så ved jeg ikke hvorfor den her funktion er her...
    @Override
  void explode(int nParticles) {
    fill(expR, expG, expB, alfa);
    ellipse(pos.x, pos.y, diameter * 2, diameter * 2);
    diameter++; // inkrementere værdien af diameter med 1
    alfa--; // dekrementere værdien af alfa med 1
  }
}

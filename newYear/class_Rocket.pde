class Rocket {
  // attributter
  int diameter = 10; // diameter
  
  int expR = (int) random(0, 256); // random RGB farvekoder for hver eksplosion/raket.
  int expG = (int) random(0, 256);
  int expB = (int) random(0, 256);
  int alfa=255;
  
  PVector pos;
  float angle = random(radians(-30), radians(30)); // Begræns vinklen til mellem -30 og 30 grader

  float xSpeed = random(-1.0, 1.0); // Tilfældig vandret hastighed
  float ySpeed = random (-3, -1.5); // lodret hastighed som skal tilpasses skærmstørrelsen
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

  void explode() {} // metode til overwirte
  


}




class Alexander extends Rocket {
  @Override
  void explode() {
    fill(r, g, b, alpha); //De forskellige farver er taget fra toppen.
    ellipse(pos.x, pos.y, diameter * 3, diameter * 3);
    noStroke();
    diameter++;
    alpha = alpha - 4;  //Den fade der er når eksplosionerne kommer
}}

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
/*********************************************/

class Islam extends Rocket {
  @Override
    void explode() {
    diameter= diameter+2;
    alpha=alpha-1;
    noStroke();
    fill(alpha=145);
    fill(255, 0, 0, alpha);
    noStroke();
    ellipse(pos.x, pos.y, diameter * 2, diameter * 2);
    diameter++;
    alpha--;
  }
}


class Tomm3634Rocket extends Rocket{
  PImage img = loadImage("Unavngivet.png");
  @Override
  void explode() {
    // Tilføj eventuelle yderligere eksplosionseffekter her
    if(alpha > 0){
      tint(255, alpha);
      image(img, pos.x, pos.y, diameter * 2, diameter * 2);
    
      alpha--;
      diameter++;
    }

    diameter++;
    alpha--;
    noStroke();
  }
}

class Magn639cRocket extends Rocket {
  @Override
    void explode() {
    // Tilføj eventuelle yderligere eksplosionseffekter her
    fill(r, g, 0, alpha);
    ellipse(pos.x, pos.y, diameter * 2, diameter * 2);
    diameter++;
    alpha--;
    noStroke();
  }

}


/**********************************************/


class luna1306Rocket extends Rocket {
  @Override
    void explode() {

    diameter +=random(-10, 10);
    alpha -= 1;
    b=220;
    g=50;
    r+=random(-10, 10);
    noStroke();
    fill(r, g, b, alpha);
   ellipse(pos.x, pos.y, diameter * 2, diameter * 2);
  }
}
    

/*************************************/


/*************************************/

class Rocket2 extends Rocket {
  void explode() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(r, b, g, alpha);
    for (int i=0; i<360; i++) {
      fill(r, g, b, alpha);
      rect(0, 0, 0, 1*i);
      rotate(1);
    }
    popMatrix();
    // gør eksplosion gennemsigtig
    alpha-=2;
  }
}

/*************************************/

class Rocket3 extends Rocket {
  void explode() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(r, b, g, alpha);

    for (int i=0; i<100; i++) {
      fill(r, g, b, alpha);
      rect(0, 0, 0, 1*i);
      rotate(1);
    }
    popMatrix();
    // gør eksplosion gennemsigtig
    alpha--;


  }
}

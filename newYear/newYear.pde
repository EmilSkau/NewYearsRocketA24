import processing.sound.*; // importer lydbibliotek


SoundFile fireRocket;
SoundFile multiRocket;
SoundFile singleRocket;



int listSize = 20;
Rocket[] rocketBattery1 = new Rocket[listSize];
Rocket[] rocketBattery2 = new Rocket[listSize];
Rocket[] rocketBattery3 = new Rocket[listSize];


// for at skyde raketter af
int counter=0;

void setup() {

  size(1200, 800);
  background (0);

  // initering af raketter
  for (int i =0; i<rocketBattery1.length; i++) {
    rocketBattery1[i] = new Islam();
    rocketBattery2[i] = new luna1306Rocket();
    rocketBattery3[i] = new Magn639cRocket();
  }

  fireRocket = new SoundFile(this, "start.mp3");
  multiRocket = new SoundFile(this, "multiRaket.mp3");
  singleRocket = new SoundFile(this, "raket1.mp3");

  // for at undgå at den bliver afspillet 60x i sek
  fireRocket.play(); // Afspil startlyd når raketten begynder at bevæge sig
}

void draw() {
  background (0);

  if (counter == 0) {
    for (int i =0; i<rocketBattery1.length; i++) {
      rocketBattery1[i].display();
      rocketBattery1[i].move();
    }
  }
  if (counter == 1) {
    background (0); // for at fjerne gamle raketter

    for (int i =0; i<rocketBattery2.length; i++) {
      rocketBattery2[i].display();
      rocketBattery2[i].move();
    }
  }
  if (counter == 2) {
    background (0);// for at fjerne gamle raketter

    for (int i =0; i<rocketBattery1.length; i++) {
      rocketBattery3[i].display();
      rocketBattery3[i].move();
    }
  }
}


void mouseClicked() {
  println("l");
  counter++;
}

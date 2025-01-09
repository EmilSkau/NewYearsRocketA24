import processing.sound.*; // importer lydbibliotek


SoundFile fireRocket;
SoundFile multiRocket;
SoundFile singleRocket;

boolean soundPlayed = false;


int listSize = 1000;
int listSize = 20;
Rocket[] rocketBattery1 = new Rocket[listSize];
Rocket[] rocketBattery2 = new Rocket[listSize];
Rocket[] rocketBattery3 = new Rocket[listSize];
Rocket[] rocketBattery4 = new Rocket[listSize];
Rocket[] rocketBattery5 = new Rocket[listSize];
Rocket[] rocketBattery6 = new Rocket[listSize];


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
    
    rocketBattery5[i] = new Rocket2();
    rocketBattery6[i] = new Rocket3();

  }

  fireRocket = new SoundFile(this, "start.mp3");
  multiRocket = new SoundFile(this, "multiRaket.mp3");
  singleRocket = new SoundFile(this, "raket1.mp3");
}

void draw() {
  background (0); //<>//
  if (counter==0) {
    fire(rocketBattery1);
  }
  if (counter==1) {
    fire(rocketBattery2);
  }
  if (counter==2) {
    fire(rocketBattery3);
  }
  
  if (counter==4) {
    fire(rocketBattery5);
  }
  if (counter==5) {
    fire(rocketBattery6);
  }

}



void mouseClicked() {
  println("Counter" + counter+" "+soundPlayed);
  counter++;
  soundPlayed = false;
}

void playSound() {
  if (!soundPlayed) { // Afspil startlyd når raketten begynder at bevæge sig
    soundPlayed = true;
    fireRocket.play();
  }
}


void fire(Rocket[] rocketList) {
  playSound();
  for (int i =0; i<rocketList.length; i++) {
    rocketList[i].display();
    rocketList[i].move();
  }
}

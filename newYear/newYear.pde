import processing.sound.*; // importer lydbibliotek //<>//

SoundFile fireRocket;
SoundFile multiRocket;
SoundFile singleRocket;


int listSize = 30; // Øgede listSize for at have flere farver. Ellers har jeg ikke ændrede på noget på denne side.




boolean soundPlayed = false;


Rocket[] rocketBattery1 = new Rocket[listSize];
Rocket[] rocketBattery2 = new Rocket[listSize];
Rocket[] rocketBattery3 = new Rocket[listSize];
Rocket[] rocketBattery4 = new Rocket[listSize];
Rocket[] rocketBattery5 = new Rocket[listSize];
Rocket[] rocketBattery6 = new Rocket[listSize];
Rocket[] rocketBattery7 = new Rocket[listSize];
Rocket[] rocketBattery8 = new Rocket[listSize];
Rocket[] rocketBattery9 = new Rocket[listSize];
Rocket[] rocketBattery10 = new Rocket[listSize];




// for at skyde raketter af
int counter=0;


void setup() {
  size(1200, 800);
  background(0);
  noStroke();
  // initering af raketter
  for (int i =0; i<rocketBattery1.length; i++) {
    rocketBattery1[i] = new Islam();
    rocketBattery2[i] = new luna1306Rocket();
    rocketBattery3[i] = new Magn639cRocket();
    rocketBattery4[i] = new Tomm3634Rocket();
    rocketBattery5[i] = new oliv178e();
    rocketBattery6[i] = new Alexander();
    rocketBattery7[i] = new Thore();
    rocketBattery8[i] = new Rocket2();
    rocketBattery9[i] = new Rocket3();
    rocketBattery10[i] = new asbj2247();
  }
  fireRocket = new SoundFile(this, "start.mp3");
  multiRocket = new SoundFile(this, "multiRaket.mp3");
  singleRocket = new SoundFile(this, "raket1.mp3");


  // for at undgå at den bliver afspillet 60x i sek
  fireRocket.play(); // Afspil startlyd når raketten begynder at bevæge sig
}


//batteri / kasse
//  rectMode(CENTER);
//  fill(170, 66, 255);
//  noStroke();

//  rect(width/2, height - 10, 50, 20); //Width er divideret med 2 for at få midten



void draw() {
  background (0);

  switch(counter) {
  case 1:
    fire(rocketBattery1);
    break;
  case 2:
    fire(rocketBattery2);
    break;
  case 3:
    fire(rocketBattery3);
    break;
  case 4:
    fire(rocketBattery4);
    break;
  case 5:
    fire(rocketBattery5);
    break;
  case 6:
    fire(rocketBattery6);
    break;
  case 7:
    fire(rocketBattery7);
    break;
  case 8:
    fire(rocketBattery8);
    break;
  case 9:
    fire(rocketBattery9);
    break;
  case 10:
    fire(rocketBattery10);
    break;
  default:
    fire(rocketBattery1);
    break;
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

import processing.sound.*; // importer lydbibliotek

SoundFile fireRocket; 
SoundFile multiRocket;
SoundFile singleRocket;

public int listSize = 30; // Øgede listSize for at have flere farver. Ellers har jeg ikke ændrede på noget på denne side.
Rocket[] rocketBattery = new Rocket[listSize];

void setup() {
  noStroke(); // Sletter kanten af cirklerne.
  size(1200, 800);
  background(100);
  for (int i = 0; i < rocketBattery.length; i++) {
    rocketBattery[i] = new Rocket(); 
  }
  fireRocket = new SoundFile(this, "start.mp3");
  multiRocket = new SoundFile(this, "multiRaket.mp3");
  singleRocket = new SoundFile(this, "raket1.mp3");
  
  // for at undgå at den bliver afspillet 60x i sek
  fireRocket.play(); // Afspil startlyd når raketten begynder at bevæge sig
}

void draw() {
  background(100);
  for (int i = 0; i < rocketBattery.length; i++) {
      rocketBattery[i].display();
      rocketBattery[i].move();
   }
}

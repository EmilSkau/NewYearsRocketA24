
int listSize = 20;
Rocket[] raketlist = new Rocket[listSize];


void setup() {

  size(800, 800);
  for (int i =0; i<raketlist.length; i++) {
    raketlist[i] = new Rocket();
  }
}

void draw() {
  background (0);
  
  for (int i =0; i<raketlist.length; i++) {
  raketlist[i].display();
  raketlist[i].move();
  }
  
}

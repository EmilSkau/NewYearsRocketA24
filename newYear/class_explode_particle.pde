class ExplodeParticle
{
  int diameter = 3; // Diameter for hver partikel.
  int alpha = 255;

  void displayParticle(float xPos, float yPos) // xPos og yPos er der for at kunne have partiklerne tilfældigt placeret rund om eksplosionen.
  {
    int R = (int) random(0, 256);
    int G = (int) random(0, 256);
    int B = (int) random(0, 256); // tilfældige RGB koder for hver partikel, for at give en effekter at der er "sparkles"

    fill(R, G, B, alpha); // Jeg har forsøgt på at få partiklerne til at forsvinde efter noget tid. Lidt ligesom du gør med eksplosionen. Men min hjerne kan ikke finde ud af det lige nu :)
    ellipse(xPos, yPos, diameter, diameter);
    alpha--;
    
  }
}

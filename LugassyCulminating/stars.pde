Star[] star = new Star[60];
void stars() {
  for (int i = 0;i < star.length; i++) {
    star[i].update();
  }
}

class Star {
  float x, y, r, speed;
  Star() {
    x = random(0, sizeX);
    y = random(0, sizeY);
    r = random(1, 4);
    speed = random(1, 3);
  } 
  void update() {
    fill (255);
    ellipse(x, y, r, r);
    y-= speed;
    if (y <= 0) {
      x = random(0, sizeX);
      y = sizeY;
      r = random(1, 4);
      speed = random(1, 3);
    }
  }
}


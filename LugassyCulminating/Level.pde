class Level {
  int frameCounter = 0;
  ArrayList <Ship> ship = new ArrayList <Ship>();
  ArrayList <Bullet> b = new ArrayList <Bullet>();
  Level() {
  }
  void addShip() {
  }
  void update() {
    background(0);
    frameCounter++;
    stars();
    addShip();
    for (int i = 0; i < b.size(); i++) {
      if (b.get(i).erase) {
        b.remove(i); 
        i--;
      }
      else {
        b.get(i).update();
        b.get(i).display();
      }
    }



    for (int i = 0; i < ship.size(); i++) {

      ship.get(i).update(); 
      if (ship.get(i).erase()&& i > 0) {
        if (ship.get(i).shield <= 0)
          ship.get(0).points+= ship.get(i).points;
        ship.remove(i);
        i--;
      }
      else {
      }
      ship.get(i).display();
      ship.get(0).hitbox[0].display();
    }
    ship.get(0).drawHud();
  }
}

class LevelOne extends Level {
  int swiperTime=300, turretTime=100, wideshipTime=100;

  LevelOne() {
    ship.add(new Buster());
  } 
  void addShip() {
    if (ship.get(0).lives < 1) {
      menu = 1;
      level = new LevelOne();
    }
    if (frameCounter >= 2000) {
      level = new LevelTwo();
    }
    if (frameCounter <= 1500) {
      if (frameCount % turretTime == 0) {

        ship.add(new Turret(random(0, hud), random(-150, -50), 40, 40, random(4, 6), 3));
        turretTime = (int)random (50, 100);
      }
    }
    else {
      fill (0, 0, 0, 200); 
      rect(0, 0, sizeX, sizeY);
    }
  }
}

class LevelTwo extends Level {
  int swiperTime=300, turretTime=100, wideshipTime=100;

  LevelTwo() {
    ship.add(new Buster());
  } 
  void addShip() {
    if (ship.get(0).lives < 1) {
      menu = 1;
      level = new LevelOne();
    }
    if (frameCounter >= 2000) {
      level = new LevelThree();
    }
    if (frameCounter <= 1500) {

      if (frameCount % turretTime == 0) {

        ship.add(new Turret(random(0, hud), random(-150, -50), 40, 40, random(4, 6), 7));
        turretTime = (int)random (50, 100);
      }
      if (frameCount % wideshipTime == 0) {
        ship.add(new WideShip(random(0, hud), random(-150, -50), 3, random(210, 320), 10));
        wideshipTime = (int)random (100, 150);
      }
    }
     else {
      fill (0, 0, 0, 200); 
      rect(0, 0, sizeX, sizeY);
    }
  }
}

class LevelThree extends Level {
  int swiperTime=300, turretTime=100, wideshipTime=100;

  LevelThree() {
    ship.add(new Buster());
  } 
  void addShip() {
    if (ship.get(0).lives < 1) {
      menu = 1;
      level = new LevelOne();
    }
    
      if (frameCount % swiperTime == 0) {
        ship.add(new Swiper(0, random(100, 300), 50, 50, random(3, 5), random(0, 360), 5));

        swiperTime = (int)random(500-frameCounter/50, 800);
      }
      if (frameCount % turretTime == 0) {

        ship.add(new Turret(random(0, hud), random(-150, -50), 40, 40, random(4, 6), 10));
        turretTime = (int)random (50, 100);
      }
      if (frameCount % wideshipTime == 0) {
        ship.add(new WideShip(random(0, hud), random(-150, -50), 3, random(210, 320), 15));
        wideshipTime = (int)random (100, 150);
      }
    
  }
}



// introduces the attack class
class Attack {

  // creates a Bullet called patern
  Bullet[] pattern;

  // introduces the power, maxCD, cd, x, y, type, onCD variables
  int power, maxCD, cd = 0; 
  float x, y;
  String type;
  boolean onCD;

  // constructor for the Attack class
  Attack(float x, float y, int power, String type, int maxCD) {
    this.x = x;
    this.y = y;
    this.power = power;
    this.type = type;
    this.maxCD = maxCD;
  }

  // introduces the fire method
  void fire() {

    // checks if the attack is not on cd
    if (!onCD) {

      // adds the pattern Bullet array to the levels bullet ArrayList
      for (int i = 0; i < pattern.length; i++) {
        level.b.add(pattern[i]);
      }
      onCD = true;
    }
  }

  // creates the peram method to reset the x and y perametres
  void peram (float x, float y) {
    this.x = x;
    this.y = y;
  }

  // creates the update pattern method (to be changed in the extended files)
  void updatePattern() {
  }

  // creates the update method
  void update() {

    // updates the pattern
    updatePattern();

    // checks if the attack is on cooldown
    if (onCD) {

      // if the framecount has a modulus of 0 the ability gets off cooldown
      if (frameCount % maxCD <= 0)
        onCD = false;
    }
  }
}

/*
 creates the BusterAttack class based off the Attack class 
 (I was going to implement multiple characters so 
 I thought buster was a good idea...
 */
class BusterAttack extends Attack {

  // constructor for the BusterAttack class
  BusterAttack(float x, float y, int power) {

    // supers the values to the Attack class
    super(x, y, power, "ally", 10);

    // initializes the Bullet pattern
    pattern = new Bullet[5];

    // creates the bullet's pattern
    for (int i = 0; i < pattern.length; i++) {
      pattern[i] = new NormalBullet(x, y, hud/40, sizeY / 30, 8, 90.0-5 + i*2.5, 0.0, power, "ally", NormalBullet_Image);
    }
  }

  // overwrites the updatePattern class
  void updatePattern() {

    // creates the bullet's pattern
    for (int i = 0; i < pattern.length; i++) {
      pattern[i] = new NormalBullet(x, y, hud/40, sizeY / 30, 8, 90.0-5 + i*2.5, 0.0, power, "ally", NormalBullet_Image);
    }
  }
}

// creates the BusterSecondary class that extend the base class Attack
class BusterSecondary extends Attack {

  // the BusterSecondary constructor
  BusterSecondary(float x, float y, int power) {

    // supers the values to the Attack class
    super(x, y, power, "ally", 50);

    // initiallizes the bullet's pattern
    pattern = new Bullet[1];

    // adds the bullets
    for (int i = 0; i < pattern.length; i++) {
      pattern[i] = new SecondaryBullet(x, y, hud/40, sizeY / 30, 8, 90.0, 0.0, power, "ally", NormalBullet_Image);
    }
  }

  // overwrites the updatePattern method
  void updatePattern() {

    // initializes the bullets pattern
    for (int i = 0; i < pattern.length; i++) {
      pattern[i] = new SecondaryBullet(x, y, sizeY/25, sizeY / 25, 5, 90, 0, power, "ally", SecondaryBullet_Image);
    }
  }
}

// creates the TurretAttack class that extends the base class Attack
class TurretAttack extends Attack {

  // the constructor for the TurretAttack class
  TurretAttack(float x, float y, int power) {

    // supers the values to the Attack class
    super(x, y, power, "enemy", 40);

    // initiallizes the bullet's pattern
    pattern = new Bullet[2];
    for (int i = 0; i < pattern.length; i++) {

      // creates the bullet into the Bullet pattern array
      pattern[i] = new NormalBullet(x, y, hud/40, sizeY / 40, 5, 90.0-5 + i*2.5, 0.0, power, "enemy", NormalBullet_Image);
    }
  }

  // overwrites the updatePattern method
  void updatePattern() {

    // updates the bullets in the pattern array
    for (int i = 0; i < pattern.length; i++) {
      pattern[i] = new NormalBullet(x+ i *15-3, y, hud/60, sizeY / 60, 3, 270, 0, power, "enemy", TurretBullet_Image);
    }
  }
}

// creates the SwiperAttack class from the base class Attack
class SwiperAttack extends Attack {

  // the constructor for the SwiperAttack class
  SwiperAttack(float x, float y, int power) {
    
    // supers the values to the base Attack class
    super(x, y, power, "enemy", 25);
    
    // initializes the bullet's pattern for the pattern array
    pattern = new Bullet[25];
    for (int i = 0; i < pattern.length; i++) {
      pattern[i] = new NormalBullet(x, y, hud/40, sizeY / 30, -3, 90.0-30 + i*15, 0.0, power, "enemy", YellowBullet_Image);
    }
  }
  
  // overwrites the updatePattern method from the base Attack class
  void updatePattern() {
    for (int i = 0; i < pattern.length; i++) {
      pattern[i] = new NormalBullet(x, y, hud/40, sizeY / 30, -3, 90.0-30 + i*15, 0.001, power, "enemy", YellowBullet_Image);
    }
  }
}


// creates the WideShipAttack class from the base Attack class 
class WideShipAttack extends Attack {

  // the constructor for the WideShipAttack class
  WideShipAttack(float x, float y, int power) {
    
    // supers the values to the base Attack class
    super(x, y, power, "enemy", 100);
    
    // initializes the bullet's pattern array
    pattern = new Bullet[5];
    for (int i = 0; i < pattern.length; i++) {
      pattern[i] = new NormalBullet(x-2*(sizeY/40+5) + i * (sizeY/40+5), y, sizeY/40, sizeY / 40, 3, 270, 0, power, "enemy", WideShipBullet_Image);
    }
  }
  
  // overwrites the updatePattern method
  void updatePattern() {
    for (int i = 0; i < pattern.length; i++) {
      pattern[i] = new NormalBullet(x-2*(sizeY/40+5) + i * (sizeY/40+5), y, sizeY/40, sizeY / 40, 6, 270, 0, power, "enemy", WideShipBullet_Image);
    }
  }
}


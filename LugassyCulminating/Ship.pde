class Ship {
  float x, y, speed, angle, acc, w, h;
  boolean erase = false;
  int power, lives = 1, shield, s1=0, s2=0, attackSelect = 0, points = 0;
  int[] image = {
    0, 0
  };
  PImage[][] sprite;

  String type;
  boolean vuln = true, canMove = true, isFiring = false, Left = false, Right = false, Up = false, Down = false;
  Hitbox[] hitbox;
  Attack[] attack;
  Ship(float x, float y, float w, float h, float speed, float angle, float acc, int power, String type, PImage[][] sprite) {
    this.x = x; 
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.angle = angle;
    this.acc = acc;
    this.type = type;
    this.power = power;
    this.sprite = sprite;
  }
  void updateHitbox() {
  }
  void drawHud() {
  }
  void update() {
    updateHitbox();
    if (Up && Left) angle = 135 / 57.2957795;
    else if (Up && Right) angle = 45 / 57.2957795;
    else if (Down && Left) angle = 225 / 57.2957795;
    else if (Down && Right) angle = 315 / 57.2957795;
    else if (Up) angle = 90 / 57.2957795;
    else if (Down) angle = 270 / 57.2957795;
    else if (Left) angle = 180 / 57.2957795;
    else if (Right) angle = 0 / 57.2957795;
    else canMove = false;
    if (isFiring) {
      attack[attackSelect].fire();
    }
    if (Right) {
      image[0]= 2;
    }
    else if (Left) {
      image[0] = 1;
    }
    else {
      image[0] = 0;
    }

    if (canMove) {
      x += speed * cos(angle);
      y -= speed * sin(angle);
    }
    for (int i = 0; i < attack.length; i++) {
      attack[i].peram(x+w/2, y+h/2);
      attack[i].update();
    }
  }
  boolean erase() {
    if (shield <= 0) {
      return true;
    }
    else 
      return false;
  }

  void display() {
    image(sprite[image[0]][image[1]], x, y, w, h);
  }
}

class PlayerShip extends Ship {
  int numKeys = 0;

  int[] boundaries = {
    (int)(x+w/4), (int)(x + 3*w/4), (int)(y+h/4), (int)(y + 3*h/4)
    };

    void drawHud() {
      strokeWeight(10);
      fill (255, 200, 255);
      rect(hud, 0, sizeX/3, sizeY);
      fill (200, 255, 200);
      rect(hud+sizeX/15, sizeY/12, sizeX/5, sizeY/4);
      image(Portrait, hud+sizeX/15, sizeY/12, sizeX/5, sizeY/4);
      textSize(20);
      fill(200, 255, 200);
      rect(hud+sizeX/15-20, sizeY/12+sizeY/4 + 50, sizeX/5+40, sizeY/2+20);
      fill(155, 100, 155);
      text("Shields: " + shield + "\nPoints: " + points +"\nLives: " + lives + "\nTime: "+ level.frameCounter, hud+80, sizeY/12+300);
    }

  void updateHitbox() {
    if (shield < 0) {
      lives--; 
      shield = 100;
      x = hud/2;
      y = 3*sizeY/4;
    }
    if (x+w>=hud)x = hud -w;
    if (x<=0)x = 0;
    if (y+h>=sizeY)y = sizeY -h ;
    if (y<=0)y = 0;
    boundaries[0] = (int)(x+3*w/8);
    boundaries[1] = (int)(x+5*w/8);
    boundaries[2] = (int)(y+4*h/10+7);
    boundaries[3] = (int)(y+6*h/10+7);
    hitbox[0] = new Hitbox (boundaries);
  }
  PlayerShip(float speed, int power, PImage[][] sprite) {
    super (hud/2, sizeY - sizeY / 8, hud / 13, sizeY / 10, speed, 90, 0, power, "ally", sprite);
    hitbox = new Hitbox[1];
    hitbox[0] = new Hitbox (boundaries);
    canMove = false;
    shield = 100;
    lives = 3;
  }
}

class Buster extends PlayerShip {

  Buster() {
    super(4, 5, Buster_Image );
    attack = new Attack[2];
    attack[0] = new BusterAttack(x-50, y, 1);
    attack[1] = new BusterSecondary(x, y, 1);
  }
}



class EnemyShip extends Ship {
  int[] boundaries = {
    (int)x, (int)(x + w), (int)y, (int)(y + h)
    };
    EnemyShip(float x, float y, float w, float h, float speed, float angle, float acc, int power, PImage[][] sprite) {
      super(x, y, w, h, speed, angle, acc, power, "enemy", sprite);
      hitbox = new Hitbox [1];
      hitbox[0] = new Hitbox (boundaries);
      canMove = true;
    }
  boolean erase() {
    if (shield <= 0|| x > sizeX+100 || x < -200 || y > sizeY + 100 || y < -200) {
      return true;
    }
    return false;
  }


  void update() {
    erase();
    if (canMove) {
      x += speed * cos(angle);
      y -= speed * sin(angle);
    }
    attack[0].fire();
    for (int i = 0; i < attack.length; i++) {
      attack[i].peram(x+w/2, y+h/2);
      attack[i].update();
    }
  }
}

class Turret extends EnemyShip {

  Turret(float x, float y, float w, float h, float speed, int power) {
    super(x, y, w, h, speed, 270/57.2957795, 0, power, Turret_Image);
    shield = 20;
    attack = new Attack [1];
    attack[0] = new TurretAttack(x, y, power);
    points = 100;
  } 
  void updateHitbox() {
    boundaries[0] = (int)x;
    boundaries[1] = (int)(x+w);
    boundaries[2] = (int)y;
    boundaries[3] = (int)(y+h);
    hitbox[0] = new Hitbox (boundaries);
  }
  void update() {

    updateHitbox();
    attack[0].fire();
    if (canMove) {
      x += speed * cos(angle);
      y -= speed * sin(angle);
    }
    for (int i = 0; i < attack.length; i++) {
      attack[i].peram(x+w/2, y+h/2);
      attack[i].update();
    }
  }
}


class Swiper extends EnemyShip {

  Swiper(float x, float y, float w, float h, float speed, float angle, int power) {
    super(x, y, w, h, speed, angle/57.2957795, 0, power, Swiper_Image);
    shield = 20;
    attack = new Attack [1];
    attack[0] = new SwiperAttack(x, y, power);
    points = 200;
    if (angle*57.2957795 > 90 && angle*57.2957795 < 270){
         x = 800; 
       }
       else {
        x = -100; 
       }
  } 
  void updateHitbox() {
    boundaries[0] = (int)x;
    boundaries[1] = (int)(x+w);
    boundaries[2] = (int)y;
    boundaries[3] = (int)(y+h);
    hitbox[0] = new Hitbox (boundaries);
  }
  void update() {

    updateHitbox();
    attack[0].fire();
    if (canMove) {
      x += speed * cos(angle);
      y -= speed * sin(angle);
    }
    for (int i = 0; i < attack.length; i++) {
      attack[i].peram(x+w/2, y+h/2);
      attack[i].update();
    }
  }
}

class WideShip extends EnemyShip {

  WideShip(float x, float y, float speed,float angle, int power) {
    super(x, y, 100, 40, speed, angle/57.2957795, 0, power, WideShip_Image);
    shield = 50;
    attack = new Attack [1];
    attack[0] = new WideShipAttack(x, y, power);
    points = 100;
  } 
  void updateHitbox() {
    if (frameCount % 20 == 0) {
      image[1]++;
      if (image[1] > 3)
        image[1] = 0;
    }

    boundaries[0] = (int)x;
    boundaries[1] = (int)(x+w);
    boundaries[2] = (int)y;
    boundaries[3] = (int)(y+h);
    hitbox[0] = new Hitbox (boundaries);
  }
  void update() {

    updateHitbox();
    attack[0].fire();
    if (canMove) {
      x += speed * cos(angle);
      y -= speed * sin(angle);
    }
    for (int i = 0; i < attack.length; i++) {
      attack[i].peram(x+w/2, y+h/2);
      attack[i].update();
    }
  }
}


PImage[][] Buster_Image = new PImage [3][1]; 
PImage NormalBullet_Image;
PImage YellowBullet_Image;
PImage SecondaryBullet_Image;
PImage[][] Turret_Image = new PImage [1][1];
PImage TurretBullet_Image;
PImage[][] Swiper_Image = new PImage [1][1];
PImage Portrait;
PImage WideShipBullet_Image;
PImage[][] WideShip_Image = new PImage [1][4];
void addSprites() {
  Buster_Image[0][0] = loadImage("Ship.png");
  Buster_Image[1][0] = loadImage("ShipLeft.png");
  Buster_Image[2][0] = loadImage("ShipRight.png");
  NormalBullet_Image = loadImage("NormalBullet.png");
  SecondaryBullet_Image = loadImage("SecondaryBullet.png");
  Turret_Image[0][0] = loadImage("Turret.png");
  Swiper_Image[0][0] = loadImage("Swiper.png");
  TurretBullet_Image = loadImage("TurretBullet.png");
  Portrait = loadImage("Portrait.png");
  YellowBullet_Image = loadImage("YellowBullet.png");
  WideShip_Image[0][0] = loadImage("WideShip.png");
  WideShip_Image[0][1] = loadImage("WideShip2.png");
  WideShip_Image[0][2] = loadImage("WideShip3.png");
  WideShip_Image[0][3] = loadImage("WideShip4.png");
  WideShipBullet_Image = loadImage("WideShipBullet.png");
}


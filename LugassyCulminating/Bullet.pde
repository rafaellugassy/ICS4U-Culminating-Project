// creates the bullet class
class Bullet {
  
  // introduces the variables for the bullet class
  int power;
  float x, y, speed, angle, acc, w, h;
  String type, onHit;
  PImage sprite;
  int[] boundaries = new int[4];
  boolean erase = false;
  
  // creates the hitbox for the Bullet class
  Hitbox hitbox;
  
  // creates a colision detector for the bullet class
  CollisionDetector cd = new CollisionDetector();
  
  // the constructor for the Bullet class
  Bullet(float x, float y, float w, float h, float speed, float angle, float acc, int power, String type, String onHit, PImage sprite) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.angle = angle;
    this.acc = acc;
    this.power = power;
    this.type = type;
    this.onHit = onHit;
    this.sprite = sprite;
  }

// creates a method to check if a ship is hit or not
  void hit (Ship ship) {
    
    // checks if the bullet's type is not the same as the ships
    if (ship.type != type) {
      
      // checks if the ship is vulnerable
      if (ship.vuln) {
        
        // checks all of the ships hitboxes to see if it hits
        for (int i = 0; i < ship.hitbox.length; i++) {
          if (cd.test(hitbox, ship.hitbox[i])) {
            
            // if it hits the ships shield goes down
            ship.shield -= ceil(power);
            
            // the bullet dissapears and is erased
            if (onHit == "disappear") erase = true;
          }
        }
      }
    }
  }
  
  // the display method for the Bullet class
  void display() {
    
    // draws the image at the angle that bullet is
    translate(x+w/2, y+h/2);
    rotate(angle/57.2957795);
    image(sprite, -w/2, -h/2, h, w);
    rotate(-angle/57.2957795);
    translate(-(x+w/2), -(y+h/2));
   
  }
  
  // empty class to be used later
  void updateHitbox() {
  }
  
  // creates the update method
  void update() {
    
    // changes the speed by the acceleration
    speed += acc;
    
    // checks if any ship is hit by a bullet
    for (int i = 0; i < level.ship.size(); i++) {
      hit(level.ship.get(i));
    }
    
    // checks if the bullet is off the map
    if (y < 0-25 || y > sizeY || x < 0-25 || x > hud)
      erase = true;
      
      // increases the x and y position by the speed in the direction
    x -= speed * cos(angle/57.2957795);
    y -= speed * sin(angle/57.2957795);
    
    // updates the hitbox
    updateHitbox();
  }
}

// creates the NormalBullet class extending the base Bullet class
class NormalBullet extends Bullet {

  // initializes the values for the hitbox
  int[] boundaries = {
    (int)x, (int)(x + w), (int)y, (int)(y + h)
    };
    
    // overwrites the updateHitbox method
    void updateHitbox() {
      
      // sets new values for the bullet and changes its hitbox
      boundaries[0] = (int)x;
      boundaries[1] = (int)(x+w);
      boundaries[2] = (int)y;
      boundaries[3] = (int)(y+h);
      hitbox = new Hitbox (boundaries);
    }

// the constructor for the NormalBullet class
  NormalBullet(float x, float y, float w, float h, float speed, float angle, float acc, int power, String type, PImage sprite) {
    
    // supers the values back to the base Attack class
    super (x-10, y, w, h, speed, angle, acc, power, type, "disappear", sprite);
    
    // initializes the hitbox with the values of the boundaries
    hitbox = new Hitbox(boundaries);
  }
}

// creates the SecondaryBullet class extending the base class Bullet
class SecondaryBullet extends Bullet {

  //initializes the boundaries array
  int[] boundaries = {
    (int)x, (int)(x + w), (int)y, (int)(y + h)
    };
    
    // overwrites the updateHitbox method
    void updateHitbox() {
      
      // updates the values for the hitbox
      boundaries[0] = (int)x;
      boundaries[1] = (int)(x+w);
      boundaries[2] = (int)y;
      boundaries[3] = (int)(y+h);
      hitbox = new Hitbox (boundaries);
    }

// the constructor for the SecondaryBullet class
  SecondaryBullet(float x, float y, float w, float h, float speed, float angle, float acc, int power, String type, PImage sprite) {
    
    // supers the values back to the Bullet class
    super (x-10, y, w, h, speed, angle, acc, power, type, "", sprite);
    hitbox = new Hitbox(boundaries);
  }
}





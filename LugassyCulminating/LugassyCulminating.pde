/*  Rafael Lugassy - Culminating Project Vers. 1.0 June 17th, 2014

 Instructions: To start the game click the start button, after that 
 enemy ships will come down.  The game starts off at easy, and each
 level the game gets harder.  After a set amount of time the level
 increases and a new ship is added to the enemy team.  The damage
 is also increased and so are the spawn rates.  At level 3 the level
 never ends and the spawn rates continuously increase making ships
 spawn more often.  You get 100 shields and 3 lives, when you lose
 all three on one level you lose and it will take you back to the 
 start menu.
 
 How to play: 
a: go left
w: go up
d: go right
s: go down
space: shoot
c: changes the bullet to the secondary bullet

if you click the pause button the game will pause
if you click the unpause button the game will unpause


*/



// adds sound player
/*
import ddf.minim.*;
Minim minim;
AudioPlayer player;
*/


// introduces variables for size, button object and the level
float sizeX=900, sizeY = 700, hud = 2* sizeX  / 3;
int menu = 1;
ArrayList <Button> button = new ArrayList <Button>();
Level level;

void setup () {
  
  // plays the music
 /* minim = new Minim (this);
   player = minim.loadFile ("Music.mp3");
   player.loop();
   */
   
   // sets the stroke and size of the console
  stroke (255, 0, 0, 100);
  size(900, 700);
  
  // adds the sprites to the program
  addSprites();
  
  // starts the level object at level one
  level = new LevelOne();
  
  // creates the stars for the background
  for (int i = 0; i < star.length; i++) {
    star[i] = new Star();
  }
}

// checks if key is pressed
void keyPressed() {
  
  // checks if the menu is in the game menu
  if (menu == 0) {
    
    // checks if the key is one of the movement keys
    if (key == 'w' || key == 's' || key == 'a' || key == 'd')
      level.ship.get(0).canMove = true;
      
      // checks if the key is the moving up key
    if (key == 'w') {
      level.ship.get(0).Up = true;
      level.ship.get(0).Down = false;
    } 
    
    // checks if the key is the moving down key
    if (key == 's') {
      level.ship.get(0).Down = true;
      level.ship.get(0).Up = false;
    } 
    
    // checks if the key is the moving left key
    if (key == 'a') {
      level.ship.get(0).Left = true;
      level.ship.get(0).Right = false;
    } 
    
    // checks if the key is the moving right key
    if (key == 'd') {
      level.ship.get(0).Right = true;
      level.ship.get(0).Left = false;
    } 
    
    // checks if the key is the shooting key
    if (key == ' ') {
      level.ship.get(0).isFiring = true;
    }
    
    // checks if the key is the secondary fire key
    if (key == 'c') {
      level.ship.get(0).attackSelect = 1;
      level.ship.get(0).speed = 2;
    }
  }
}

// checks when the key is let go so it cancels the movement
void keyReleased() {
  if (menu == 0) {
    
    // checks if the key is the moving up key
    if (key == 'w') {
      level.ship.get(0).Up = false;
    }
    
    // checks if the key is the moving down key
    if (key == 's') {
      level.ship.get(0).Down = false;
    }
    
     // checks if the key is the moving left key
    if (key == 'a') {
      level.ship.get(0).Left = false;
    }
    
     // checks if the key is the moving right key
    if (key == 'd') {
      level.ship.get(0).Right = false;
    }
    
     // checks if the key is the shooting key
    if (key == ' ') {  
      level.ship.get(0).isFiring = false;
    }
    
     // checks if the key is the secondary fire key
    if (key == 'c') {
      level.ship.get(0).attackSelect = 0;
      level.ship.get(0).speed = 4;
    }
  }
}

// the main
void draw() {
  
  // deletes all buttons and recreates them in the menus
  for (int i = 0; i < button.size(); i++) {
    button.remove(i);
  }
  
  // checks if menu is 2 and excecutes menu 2
 menu2();
 
  // checks if menu is 1 and excecutes menu 1
 menu1();
 
  // checks if menu is 0 and excecutes menu 0
 menu0();
 
 // updates all the buttons
  for (int i = 0; i < button.size(); i++) {
    button.get(i).update();
  }
}

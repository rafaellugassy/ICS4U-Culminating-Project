
class Button {
  float x, y, w, h;
  int menuSelect;
  String text;
  boolean pressed = false;
  Button (float x, float y, float w, float h,String text, int menuSelect) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.menuSelect = menuSelect;
  }  
  boolean hover() {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y+h) {
      return true;
    } 
    else {
      return false;
    }
  }
  void display() {
    fill(100, 155, 100);
    if (hover()) {
      fill(100, 255, 100);
    } 
    rect(x, y, w, h);
    fill(0,0,0);
    textMode(CENTER);
    text(text, x +30,y + h/2);
    textMode(LEFT);
  }
  void update() {
    display();

   
  }
}


class MenuButton extends Button {
  
  
    MenuButton (float x, float y, float w, float h,String text, int menuSelect) {
     super (x,y,w,h,text,menuSelect); 
    }
  

 void update() {
    display();

    if (mousePressed && hover()) {
      menu = menuSelect;
      pressed = true;
    }
  }  
}

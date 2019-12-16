void menu0() {
  if (menu == 0) {
    button.add(new MenuButton(hud + 75, sizeY- 200, 150, 50, "  pause", 2));
    level.update();
    level.ship.get(0).hitbox[0].display();
  }
}

void menu1() {
  if (menu == 1) {
  background(0);
  stars();
  button.add(new MenuButton(sizeX / 3, 2*sizeY/ 5, sizeX/10, sizeY/15, "Start", 0));
}
}
void menu2() {
  if (menu == 2) {
  button.add(new MenuButton(hud + 75, sizeY- 125, 150, 50, "unpause", 0));
}
}


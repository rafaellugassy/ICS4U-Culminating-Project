class Hitbox {
  int[] boundaries;
  int w, h;

  Hitbox (int[] boundaries) {
    w = boundaries[1] - boundaries[0];
    h = boundaries[3] - boundaries[2];

    if (w % 2 == 0) boundaries [1]--;
    if (h % 2 == 0) boundaries [3]--;

    w = boundaries[1] - boundaries[0];
    h = boundaries[3] - boundaries[2];

    this.boundaries = boundaries;
  }

  void display () {
    stroke (255, 0, 0, 100);
    strokeWeight (1);
    noFill();
    rect (boundaries[0], boundaries[2], w, h);
  }
}


class CollisionDetector {
  boolean test (Hitbox h1, Hitbox h2) {
    return (!(h1.boundaries[0] > h2.boundaries[1] || h1.boundaries[1] < h2.boundaries[0] || h1.boundaries[2] > h2.boundaries[3] || h1.boundaries[3] < h2.boundaries[2]));
  }
}

Spaceship ship = new Spaceship();
Star[] dot = new Star[300];
public void setup() {
  background(0);
  size(800, 800);
  for (int i = 0; i < 300; i ++) {
    dot[i] = new Star();
  }
}
double acc = 0;
double turn = 0;
public void draw() {
  background(0);
  if (keyPressed == true && key == 'w') {
    acc += .0005;
  }
  if (keyPressed == true && key == 's') {
    acc -= .0005;
  }
  if (keyPressed == true && key == 'a') {
    turn -= .1;
  }
  if (keyPressed == true && key == 'd') {
    turn += .1;
  }

  for (int i = 0; i < dot.length; i ++) {
    dot[i].show();
  }
  ship.accelerate(acc);
  ship.turn(turn);
  ship.move();
  ship.show();

  if (turn > 0) {
    turn -=.05;
  } else if (turn < 0) {
    turn += .05;
  }
  if (acc > 0) {
    acc -=.00025;
  } else if (acc < 0) {
    acc += .00025;
  }
  if (keyPressed == true && key == 'e') {
    acc = 0;
    ((Spaceship)ship).stopXspeed();
    ((Spaceship)ship).stopYspeed();
  }
}


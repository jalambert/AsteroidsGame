Spaceship ship = new Spaceship();
Asteroid rock = new Asteroid();
ArrayList <Asteroid> rockList;

Star[] dot = new Star[300];
public void setup() {
  background(0);
  size(800, 800);
  rockList = new ArrayList <Asteroid>();

  for (int k = 0; k < 25; k++) {
    rockList.add(new Asteroid());
  }
  for (int i = 0; i < dot.length; i ++) {
    dot[i] = new Star();
  }
}
double acc = 0; 
double turn = 0; 
boolean wPressed, aPressed, dPressed, sPressed;
public void draw() {
  background(0, 0, 0); 
  for (int i = 0; i < rockList.size(); i++) {
    float close = dist((float)ship.getMyCenterX(), (float)ship.getMyCenterY(), (float)rockList.get(i).getMyCenterX(), (float)rockList.get(i).getMyCenterY());
    if (close < 10*rockList.get(i).getScale()) {
      rockList.remove(i);
    }
  }
  if (wPressed) {
    acc += .0005;
  }
  if (sPressed) {
    ((Spaceship)ship).hyperspace();
    sPressed = false;
  }
  if (aPressed) {
    turn -= .1;
  }
  if (dPressed) {
    turn += .1;
  }


  for (int i = 0; i < dot.length; i ++) {
    dot[i].show();
  }
  for (int j = 0; j < rockList.size(); j ++) {
    rockList.get(j).show();
    rockList.get(j).turn(rockList.get(j).turning);
    rockList.get(j).move();
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
  if (acc < .0005 && acc >- .0005) {
    acc = 0;
    ship.setMyXspeed(0);
    ship.setMyYspeed(0);
  } else if (acc > 0) {
    acc -=.00025;
  } else if (acc < 0) {
    acc += .0025;
  }
  if (ship.getMyXspeed() > 0 && wPressed == false) {
    ship.setMyXspeed(ship.getMyXspeed() -.05);
  } else if (ship.getMyXspeed() < 0 && wPressed == false) {
    ship.setMyXspeed(ship.getMyXspeed() +.05);
  }
  if (ship.getMyYspeed() > 0 && wPressed == false) {
    ship.setMyYspeed(ship.getMyYspeed() -.05);
  } else if (ship.getMyYspeed() < 0 && wPressed == false) {
    ship.setMyYspeed(ship.getMyYspeed() +.05);
  }
}

public void keyPressed() {
  if (key == 'w') {
    wPressed = true;
  }
  if (key == 's') {
    sPressed = true;
  }
  if (key == 'a') {
    aPressed = true;
  }
  if (key == 'd') {
    dPressed = true;
  }
}
public void keyReleased() {
  if (key == 'w') {
    wPressed = false;
  }
  if (key == 's') {
    sPressed = false;
  } 
  if (key == 'a') {
    aPressed = false;
  }
  if (key == 'd') {
    dPressed = false;
  }
}

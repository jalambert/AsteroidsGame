Spaceship ship = new Spaceship();
Asteroid[] rock = new Asteroid[25];
Star[] dot = new Star[300];
public void setup() {
  background(0);
  size(800, 800);
  for (int i = 0; i < dot.length; i ++) {
    dot[i] = new Star();
  }
  for (int j = 0; j < rock.length; j ++) {
    rock[j] = new Asteroid();
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
  for (int j = 0; j < rock.length; j ++) {
    rock[j].show();
    rock[j].turn(rock[j].turning);
    rock[j].move();
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

class Asteroid extends Floater {
  double turning; 
  float scale; 
  Asteroid() {
    turning = Math.random()*2-1;
    scale = (float)(Math.random()*2)+1; 
    corners = 7; 
    xCorners = new int[]{-4, 1, 7, 8, 3, -1, -5}; 
    yCorners = new int[]{-4, -7, -3, 2, 4, 6, 3}; 
    myColor = color((int)(Math.random()*20)+180, (int)(Math.random()*20)+180, (int)(Math.random()*20)+180); 
    myCenterX = Math.random()*800; 
    myCenterY = Math.random()*800; 
    myXspeed = Math.random()*8;; 
    myYspeed = 0; 
    myPointDirection = 0;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor); 
    stroke(40); 

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY); 

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180)); 

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians); 

    //draw the polygon
    beginShape(); 
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI]*scale, yCorners[nI]*scale);
    }
    endShape(CLOSE); 

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians); 
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}

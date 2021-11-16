class Spaceship extends Floater {   
  Spaceship() {
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};
    myColor = color(255);
    myCenterX = 400;
    myCenterY = 400;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  void stopXspeed(){
    myXspeed = 0;
  }
  void stopYspeed(){
    myYspeed = 0;
  }
}

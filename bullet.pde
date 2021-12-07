class Asteroid extends Floater {
  protected double turning; 
  protected float scale; 
  Asteroid() {
    turning = Math.random()*2-1;
    scale = (float)(Math.random()*2)+1; 
    corners = 7; 
    xCorners = new int[]{(int)(Math.random()*4)-6, (int)(Math.random()*4)-1, (int)(Math.random()*4)+3, (int)(Math.random()*4)+5, (int)(Math.random()*4), (int)(Math.random()*4)-2, (int)(Math.random()*4)-7}; 
    yCorners = new int[]{(int)(Math.random()*4)-6, (int)(Math.random()*4)-10, (int)(Math.random()*4)-5, (int)(Math.random()*4), (int)(Math.random()*4)+2, (int)(Math.random()*4)+4, (int)(Math.random()*4)+2}; 
    myColor = color((int)(Math.random()*60)+100); 
    myCenterX = Math.random()*800; 
    myCenterY = Math.random()*800; 
    myXspeed = (Math.random()*3)-1;
    myYspeed = (Math.random()*3)-1;
    myPointDirection = 0;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor); 
    noFill();
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
  public double getMyCenterX() {
    return myCenterX;
  }
  public double getMyCenterY() {
    return myCenterY;
  }
  public float getScale() {
    return scale;
  }
}

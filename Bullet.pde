class bullet extends Floater {
  bullet() {
    double dRadians = myPointDirection * (Math.PI/180);
    corners = 5; 
    xCorners = new int[]{-3, 0, 3, 0, -3}; 
    yCorners = new int[]{0, -1, 0, 1, 0}; 
    myColor = color(255); 
    myCenterX = ship.getMyCenterX(); 
    myCenterY = ship.getMyCenterY(); 
    myXspeed = 5 * Math.cos(dRadians);
    myYspeed = 5 * Math.sin(dRadians);
    myPointDirection = ship.getMyPointDirection();
  }
  public void move(int i) {
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if (myCenterX >width)
    {     
      magazine.remove(i);
    } else if (myCenterX<0)
    {     
      magazine.remove(i);
    }    
    if (myCenterY >height)
    {    
      magazine.remove(i);
    } else if (myCenterY < 0)
    {     
      magazine.remove(i);
    }
  }
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor); 
    stroke(255);

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    ellipse((float)ship.getMyCenterX(),(float)ship.getMyCenterY(),2,2);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}

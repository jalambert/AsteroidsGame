class Star{
  float myX,myY;
  color myColor;
  Star(){
    myX = (float)Math.random()*800;
    myY = (float)Math.random()*800;
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  void show(){
    noStroke();
    fill(myColor);
    ellipse(myX,myY,2,2);
  }
}

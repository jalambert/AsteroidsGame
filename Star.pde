class Star {
  float myX, myY, mySize;
  color myColor;
  Star() {
    myX = (float)Math.random()*800;
    myY = (float)Math.random()*800;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize = (float)Math.random()*3;
  }
  void show() {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}

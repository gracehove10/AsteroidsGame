Spaceship bob= new Spaceship ();
Star[] nightSky = new Star[200];
public void setup()
{
  size (500, 500);
  for (int i=0; i<nightSky.length; i++)
  {
    nightSky[i] = new Star();
  }
}
public void draw()
{
  background(0);
  noStroke();
  for (int i=0; i<nightSky.length; i++)
  {
    nightSky[i].show();
  }
  bob.show();
  bob.move();
}
public void keyPressed()
{
  if (key =='h')
  {
    bob.setXspeed(0);
  }
}
class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (double degreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX > width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
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
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 
class Spaceship extends Floater  
{   
   public Spaceship() {
     myCenterX = width/2;
     myCenterY = height/2;
     myColor = 255;
     myXspeed= 0;
     myYspeed = 0;
     myPointDirection = 10;
     corners = 11;
     xCorners = new int [corners];
     yCorners = new int [corners];
     xCorners[0] = -16;
     yCorners[0] = -5;
     xCorners[1] = -10;
     yCorners[1] = -5;
     xCorners[2] = -10;
     yCorners[2] = -10;
     xCorners[3] = 0;
     yCorners[3] = -7;
     xCorners[4] = 11;
     yCorners[4] = -7;
     xCorners[5] = 16;
     yCorners[5] = 0;
     xCorners[6] = 11;
     yCorners[6] = 7;
     xCorners[7] = 0;
     yCorners[7] = 7;
     xCorners[8] = -10;
     yCorners[8] = 10;
     xCorners[9] = -10;
     yCorners[9] = 5;
     xCorners[10] = -16;
     yCorners[10] = 5;
   }
   public void setXspeed(double x){
   myXspeed = x;
   }
   public void setYspeed (double y){
     myYspeed = y;
   }
}
class Star //note that this class does NOT extend Floater
{
  private int myX, myY, mySize, myColor;
  public Star()
  {
    myX = (int)(Math.random() *500);
    myY = (int) (Math.random()*500);
    mySize = (int) (Math.random()*10);
    myColor = color((float)Math.random()*255, (float)Math.random()*255, (float)Math.random()*255, ((float)Math.random()*255));
  }
  public void show()
  {
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}

int screenSize = 600;
int partSize = 10;
int trueSpeed = 10;
Snowflake [] snow;
void setup()
{
  background(0);
  size(screenSize,screenSize);
  snow = new Snowflake[100];
  for (int i = 0; i < snow.length; i++)
  {
    snow[i] = new Snowflake();
  }
}
void draw()
{
  fill(0,100);
  rect(-100,-100,screenSize+200,screenSize+200);
  for (int i = 0; i < snow.length; i++) 
  {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
}
void mouseDragged()
{
  //your code here
}

class Snowflake
{
  int x, y, speed;
  boolean isMoving;
  Snowflake()
  {
    speed = trueSpeed;
    x = (int)(Math.random()*screenSize);
    y = (int)(Math.random()*screenSize);
    isMoving = true;
  }
  void show()
  {
    noStroke();
    fill(200,200,255);
    ellipse(x,y,partSize/10,partSize);
  } 
  void lookDown()
  {
    if (y < screenSize && y > 0 && get(x, y+(partSize/2)+1) == 0) 
    {
      isMoving = false;
    }
    isMoving = true;
  }
  void erase()
  {
    fill(0);
    ellipse(x,y,7,7);
  }
  void move()
  {
    if (isMoving) {
      y = y + speed;
    }
  }
  void wrap()
  {
    if (y > screenSize) 
    {
      y = 0;
      x = (int)(Math.random()*screenSize);
      speed = (int)((Math.random()*3)+trueSpeed-1);
    }
  }
}



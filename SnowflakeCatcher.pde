int screenSize = 600;
int partSize = 10;
int trueSpeed = 5;
float deg;
Snowflake [] snow;
Umbrella blue;
void setup()
{
  background(0);
  size(screenSize,screenSize);
  snow = new Snowflake[500];
  for (int i = 0; i < snow.length; i++)
  {
    snow[i] = new Snowflake();
  }
  blue = new Umbrella(screenSize/2,screenSize/2);
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
  blue.show();
  //text(rad, 25,25);
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
    x = (int)(Math.random()*screenSize*2);
    y = (int)(Math.random()*screenSize*2);
    isMoving = true;
  }
  void show()
  {
    noStroke();
    float rad = radians(deg);
    rotate(rad);
    fill(200,200,255);
    ellipse(x,y,partSize/10,partSize);
    resetMatrix();
  } 
  void lookDown()
  {
    if (y < screenSize*2 && y > -200 && get(x, y+5) == 0) 
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
    if (x > mouseX-25 && x < mouseX+25 && y < mouseY-15 && y > mouseY)
    {
      y = -200;
    }
  }
  void wrap()
  {
    if (y > screenSize*2) 
    {
      y = -200;
      x = (int)((Math.random()*screenSize*2)-screenSize*0.5);
      speed = (int)((Math.random()*3)+trueSpeed-1);
    }
  }
}

class Umbrella
{
  int x, y;
  Umbrella(int intX,int intY)
  {
    x = intX;
    y = intY;
  }
  void show()
  {
    fill(150,150,150);
    noStroke();
    rect(mouseX-1,mouseY,2,30);
    fill(0,0,100);
    arc(mouseX,mouseY,50,50,radians(180),radians(360));
    noFill();
    stroke(150,150,150);
    strokeWeight(2);
    arc(mouseX+5,mouseY+30,10,10,radians(0),radians(180));
  }
}

void mouseMoved() {
  deg = -((mouseX - screenSize/2) / 50);
}

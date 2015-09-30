int screenSize = 600;
int partSize = 10;
int trueSpeed = 5;
float deg;
int rainNum = 0;
Snowflake [] snow;
Umbrella blue;
void setup()
{
  background(0);
  size(screenSize,screenSize);
  snow = new Snowflake[1000];
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
  blue.show();
  for (int i = 0; i < snow.length; i++) 
  {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
  //text(rad, 25,25);
}
void mouseDragged()
{
  //your code here
}

class Snowflake
{
  int x, y, speed;
  boolean isMoving, alive;
  Snowflake()
  {
    speed = trueSpeed;
    x = (int)(Math.random()*screenSize*2);
    y = (int)(Math.random()*screenSize*2);
    isMoving = true;
    alive = true;
  }
  void show()
  {
    if (get(x,y) == color(0,0,100))
    {
      y = -200;
      x = (int)(Math.random()*screenSize*2);
      noStroke();
      float rad = radians(deg);
      rotate(rad);
      fill(200,200,255);
      ellipse(x,y,partSize/10,partSize);
      resetMatrix();
    }
    if (alive)
    {
      noStroke();
      float rad = radians(deg);
      rotate(rad);
      fill(200,200,255);
      ellipse(x,y,partSize/10,partSize);
      resetMatrix();
    }
  } 
  void lookDown()
  {
    if (y < screenSize*2 && y > -200 && get(x, y) == color(0,0,100)) 
    {
      isMoving = false;
    }
    isMoving = true;
  }
  void erase()
  {
    fill(0);
    noStroke();
    ellipse(x,y,partSize/10,partSize);
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
      y = -200-(rainNum*4);
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
    float rad = radians(deg);
    rotate(rad);
    fill(150,150,150);
    noStroke();
    rect(mouseX-1,mouseY,2,30);
    fill(0,0,100);
    arc(mouseX,mouseY,80,80,radians(180),radians(360));
    noFill();
    stroke(150,150,150);
    strokeWeight(2);
    arc(mouseX+5,mouseY+30,10,10,radians(0),radians(180));
  }
}

void mouseMoved() {
  deg = -((mouseX - screenSize/2) / 20);
  rainNum = screenSize-((int)(mouseY));
}

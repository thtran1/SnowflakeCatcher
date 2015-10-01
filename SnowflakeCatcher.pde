int startX = 150;
int startY = 0;
int endX = 150;
int endY = 00;
int screenSize = 600;
int partSize = 10;
int trueSpeed = 5;
float deg;
int rainNum = 0;
Snowflake [] snow;
Cloud [] grey;
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
  grey = new Cloud[10];
  for (int i = 0; i < grey.length; i++)
  {
    grey[i] = new Cloud(-200+(i*50),10,(int)(Math.random()*50)+650, (int)(Math.random()*50)+50);
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
    snow[i].show();
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
  }
  int lightning = (int)(Math.random()*200)+50;
  stroke(lightning, lightning, (int)(Math.random()*200)+50);
  while (endY < screenSize) {
    endX = startX + (int)(random(-9, 9));
    endY = startY + (int)(random(0, 9));
    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
  }
  noStroke();
  for (int i = 0; i < grey.length; i++) 
  {
    grey[i].move();
    grey[i].show();
  }
  //text(rad, 25,25);
}
void mouseDragged()
{
  //your code here
}

class Cloud
{
  int cX, cY, sX, sY, spd;
  Cloud(int x, int y, int sx, int sy)
  {
    cX = x;
    cY = y;
    sX = sx;
    sY = sy;
    spd = (int)((Math.random()*3)+1);
  }
  void move()
  {
    cX = cX+spd;
    int ran = (int)((Math.random()*100)+screenSize*2);
    if(cX > ran)
    {
      cX = -screenSize;
    }
  }
  void show()
  {
    int col = 100;
    for (int i = 3; i < 4; i++)
    {
      fill(col, col, col);
      ellipse(cX, cY, sX, sY);
      resetMatrix();
    }
  }
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
      y = -200-(rainNum*5);
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
    float rad = radians(deg);
    rotate(rad);
    fill(0);
    noStroke();
    ellipse(x,y,partSize/10,partSize);
    resetMatrix();
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
      y = -200-(rainNum*5);
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
    //float rad = radians(deg);
    //rotate(rad);
    fill(150,150,150);
    noStroke();
    rect(mouseX-1,mouseY,2,30);
    fill(0,0,100);
    arc(mouseX,mouseY,100,80,radians(180),radians(360));
    noFill();
    stroke(150,150,150);
    strokeWeight(2);
    arc(mouseX+5,mouseY+30,10,10,radians(0),radians(180));
  }
}

void mouseMoved() {
  deg = -((mouseX - screenSize/2) / 100);
  rainNum = screenSize-((int)(mouseY));
}

void mousePressed()
{
  startX = (int)(Math.random()*screenSize);
  startY = 0;
  endX = 150;
  endY = 0;
  fill(255,255,255,75);
  rect(-100,-100,1000,1000,80);
}
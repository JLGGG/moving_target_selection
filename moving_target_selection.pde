int rad = 30;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
int framecount = 0;

final int FIXED_FPS = 144;
final int MAX_FPS = 1500;


void setup() 
{
  size(700, 700);
  //noStroke();
  frameRate(MAX_FPS);
  ellipseMode(CENTER);
  fill(0);
  // Set the starting position of the shape
  //xpos = 0;
  //ypos = 0;
  xpos = width/2;
  ypos = height/2;
}

void draw()
{
  int tmp = frameCount*FIXED_FPS/MAX_FPS;
  if(framecount < tmp){
    if(frameRate < FIXED_FPS*2){
      // must be larger than double of FIXED_FPS to prevent aliasing
      println("Warning: Udpate freqency might be lower than FIXED_FPS.");
    }
    framecount = tmp;
    update_fixed_fps();
  }
}

void update_fixed_fps(){
  background(255);
 
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  ellipse(xpos, ypos, rad, rad);
}


//void draw() 
//{
//  background(255);
 
//  // Update the position of the shape
//  xpos = xpos + ( xspeed * xdirection );
//  ypos = ypos + ( yspeed * ydirection );
  
//  // Test to see if the shape exceeds the boundaries of the screen
//  // If it does, reverse its direction by multiplying by -1
//  if (xpos > width-rad || xpos < rad) {
//    xdirection *= -1;
//  }
//  if (ypos > height-rad || ypos < rad) {
//    ydirection *= -1;
//  }

//  // Draw the shape
//  ellipse(xpos, ypos, rad, rad);
//}

void mousePressed() {
  xpos = width/2;
  ypos = height/2;
  redraw();
}
  

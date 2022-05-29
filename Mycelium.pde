PImage img;
Hypha root, apex;
float length;

void setup() {
  fullScreen();
  background(255);
  frameRate(16);
  
  length = 30;
  root = new Hypha(0,0, length*cos(random(TAU)),length*sin(random(TAU)));
  apex = root;
  System.out.println(apex.angle()*180/PI);
}

void draw() {
  translate(width/2, height/2);
  apex.display();
  apex = apex.grow(length);
  if (Math.abs(apex.p2.x) > width/2 || Math.abs(apex.p2.y) > height/2) {
    exit();
  }
}

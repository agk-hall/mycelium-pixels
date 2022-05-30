PImage img;
Hypha root, apex;
float length;

void setup() {
  fullScreen();
  background(0);
  
  length = 1;
  root = new Hypha(0,0, length*cos(random(TAU)),length*sin(random(TAU)));
  apex = root;
  System.out.println(apex.angle()*180/PI);
}

void draw() {
  translate(width/2, height/2);
  apex.display();
  apex = apex.grow(length);
  if (abs(apex.p2.x) > width/2 || abs(apex.p2.y) > height/2) {
  }
}

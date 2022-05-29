PImage img;
Hypha root, apex;
float length;

void setup() {
  size(600, 600);
  background(255);
  //frameRate(3);
  
  length = 10;
  root = new Hypha(0,0, length*cos(random(TAU)),length*sin(random(TAU)));
}

void draw() {
  translate(width/2, height/2);
  root.display();
  root = root.grow(1);
}

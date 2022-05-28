PImage img;
HyphaPixel h;

void setup() {
  size(600, 600);
  background(255);
  
  img = loadImage("mailtwuk.png");
  h = new HyphaPixel(width/2, height/2);
  
}

void draw() {
  h.display();
  h.grow();
}

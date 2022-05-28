class HyphaPixel {
  int x, y;
  HyphaPixel[] up, down;
  float[] direction_pmf;
  
  HyphaPixel(int x, int y) {
    this.x = x;
    this.y = y;
    this.up = new HyphaPixel[4];
    this.down = new HyphaPixel[4];
    direction_pmf = new float[]{1/4, 1/4, 1/4, 1/4};  // stochastic vector
  }
  
  HyphaPixel() {
    this(0, 0);
  }
  
  void display() {
    loadPixels();
    int index = width*y + x;
    System.out.println(index);
    pixels[index] = color(0);
    updatePixels();
  }
  
  void grow() {
    int direction = randomDirection(direction_pmf);
    if (direction == 0) {  // right
      this.x++;
    } else if (direction == 1) {  // up
      this.y--;
    } else if (direction == 2) {  // left
      this.x--;
    } else if (direction == 3) {  // down
      this.y++;
    }
  }
  
}

// returns -1 if input is invalid
int randomDirection(float[] pmf) {
  if (!pmfValidate(pmf)) {  // validate the pmf
    System.err.println("Invalid pmf given to random variable generator; sum = " + (String));
    return -1;
  }
  
  float rand = random(1.0);  // uniform distrib
  float p = 0.0;  // cdf
  
  for (int i = 0; i < pmf.length; i++) {  // remap to pmf
    if (pmf[i] == 0) {continue;}  // skip zero probabilities
    p += pmf[i];  // compute cdf
    if (rand < p) {
      return i;
    }
  }
  
  return -1;  // error
}

boolean pmfValidate(float[] pmf) {
  float sum = 0.0;
  for (int i = 0; i < pmf.length; i++) {
    sum += pmf[i];
  }
  
  if (sum != 1) {
    System.err.print("Invalid pmf, sum = ");
    System.err.println(sum);
  }
  return ((sum == 1.0) ? true : false);
}

class Vector2D {
  static final int dimension = 2;
  float x, y;
  
  Vector2D(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Vector2D plus(Vector2D v) {
    return new Vector2D(this.x + v.x, this.y + v.y);
  }
  
  Vector2D minus(Vector2D v) {
    return new Vector2D(this.x - v.x, this.y - v.y);
  }

  void scale(float s) {
     x *= s;
     y *= s;
  }

  float dot(Vector2D v) {
    return this.x*v.x + this.y*v.y;
  }
  
  float cross(Vector2D v) {
    return this.x*v.y - this.y*v.x;
  }

  float angle() {
    return (float)Math.atan(y/x);
  }

  float norm() {
    return (float)Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2));
  }
}

int orientation(Vector2D v1, Vector2D v2) {
  float c = v1.cross(v2);
  if (c > 0) {
    return 1;  // anticlockwise
  } else if (c < 0) {
    return -1;  // clockwise
  } else {
    return 0;  // collinear
  }
}

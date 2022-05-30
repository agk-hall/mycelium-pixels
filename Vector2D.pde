class Vector2D {
  static final int dimension = 2;
  float x, y;  // note: y dimension is top to bottom
  
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

  // compute angle relative to standard position in left-handed coord system
  float angle() {
    if (x == 0) {  // for vertical segments
      if (y > 0) {
        return HALF_PI;  // downwards
      } else if (y < 0) {
        return -HALF_PI;  // upwards
      } else {  // zero-length vector
        System.err.println("WARNING: Zero-length Segment2D object.");
        return 0.0;
      }
    }

    // reference angle in [-PI/2, PI/2], quadrant I is bottom right
    float alpha = (float)atan(y / x);  

    if (x > 0) {  // quadrants I and IV
      return alpha;
    } else {  // quadrants II and III
      if (y > 0) {
        return PI + alpha;
      } else {
        return -PI + alpha;
      }
    }
  }

  void display(float x0, float y0) {
    stroke(0.5);
    circle(x0 - 1, y0 - 1, 2);  // vector origin
    line(0, 0, x, y);
  }

  void display() {
    display(0, 0);
  }

  float norm() {
    return (float)sqrt(pow(x, 2) + pow(y, 2));
  }
}

// helper function
int orientation(Vector2D v1, Vector2D v2) {  // fix for orientation
  float c = v1.cross(v2);
  if (c > 0) {
    return 1;  // anticlockwise
  } else if (c < 0) {
    return -1;  // clockwise
  } else {
    return 0;  // collinear
  }
}

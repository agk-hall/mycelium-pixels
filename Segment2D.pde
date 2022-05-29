class Segment2D {
  static final int dimension = 2;

  float x1, x2, y1, y2;
  Vector2D p1, p2;
  
  Segment2D(Vector2D v1, Vector2D v2) {
    this.x1 = v1.x;
    this.y1 = v1.y;
    this.x2 = v2.x;
    this.y2 = v2.y;
    this.p1 = v1;
    this.p2 = v2;
  }

  Segment2D(float x1, float y1, float x2, float y2) {
    this(new Vector2D(x1, y1), new Vector2D(x2, y2));
  }

  float angle() {
    return (float)Math.atan((y2-y1)/(x2-x1));
  }
  
  void display() {
    stroke(color(0));
    strokeWeight(0.5);
    line(x1, y1, x2, y2);
  }
  
  boolean intersects(Segment2D s) {
    int o1 = orientation(this.p2.minus(this.p1), this.p2.minus(s.p1));
    int o2 = orientation(s.p2.minus(s.p1), s.p2.minus(this.p1));

    if (o1 == o2) {
      return true;
    }
    return false;
  }
}

class Segment2D {
  static final int dimension = 2;
  Vector2D p1, p2, v;
  
  // constructors
  Segment2D(Vector2D v1, Vector2D v2) {
    this.p1 = v1;
    this.p2 = v2;
    this.v = v2.minus(v1);
  }

  Segment2D(float x1, float y1, float x2, float y2) {
    this(new Vector2D(x1, y1), new Vector2D(x2, y2));
  }

  // compute angle relative to standard position in left-handed coord system
  float angle() {
    return v.angle();
  }
  
  // displays a line segment
  void display() {
    stroke(color(255));
    strokeWeight(0.5);
    line(p1.x, p1.y, p2.x, p2.y);
  }
  
  // determines whether two segments intersect
  boolean intersects(Segment2D s) {
    int o1 = orientation(this.p2.minus(this.p1), this.p2.minus(s.p1));
    int o2 = orientation(s.p2.minus(s.p1), s.p2.minus(this.p1));

    if (o1 == o2) {
      return true;
    }
    return false;
  }
}

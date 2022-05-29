import java.util.ArrayList;

class Hypha extends Segment2D {
  Hypha parent;
  ArrayList<Hypha> children;
  
  Hypha(Vector2D v1, Vector2D v2) {
    super(v1, v2);
  }

  Hypha(float x1, float y1, float x2, float y2) {
    this(new Vector2D(x1, y1), new Vector2D(x2, y2));
  }

  Hypha grow(float length) {
    float angle = this.angle() + random(-1, 1);
    float x3 = (float)(x2 + length*Math.cos(angle));
    float y3 = (float)(y2 + length*Math.sin(angle));

    Hypha h = new Hypha(x2, y2, x3, y3);
    return h;
  }
}

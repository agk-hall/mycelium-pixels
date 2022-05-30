import java.util.ArrayList;

class Hypha extends Segment2D {
  Hypha parent;
  ArrayList<Hypha> children;
  
  Hypha(Vector2D v1, Vector2D v2) {
    super(v1, v2);
    children = new ArrayList<Hypha>();
  }

  Hypha(float x1, float y1, float x2, float y2) {
    this(new Vector2D(x1, y1), new Vector2D(x2, y2));
  }

  Hypha grow(float length) {
    float alpha = 0.5;
    float r = random(-alpha, alpha);
    float new_angle = this.angle() + r;
    float x_new = (float)(p2.x + length*cos(new_angle));
    float y_new = (float)(p2.y + length*sin(new_angle));

    Hypha h = new Hypha(p2.x, p2.y, x_new, y_new);
    h.parent = this;
    children.add(h);
    return h;
  }
}

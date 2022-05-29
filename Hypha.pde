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
    float angle = this.angle();
    System.out.println(angle*180/PI);
    float new_angle = angle + r;
    float x3 = (float)(p2.x + length*Math.cos(new_angle));
    float y3 = (float)(p2.y + length*Math.sin(new_angle));

    Hypha h = new Hypha(p2.x, p2.y, x3, y3);
    h.parent = this;
    children.add(h);
    return h;
  }
}

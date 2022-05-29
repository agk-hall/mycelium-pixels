# Vector2D
**Fields**
- x: float
- y: float

**Methods**
- plus(Vector2D): Vector2D
- minus(Vector2D): Vector2D
- scale(float): void
- dot(Vector2D): float
- cross(Vector2D): float[]

---

# Segment2D
**Fields**
- p1: Vector2D
- p2: Vector2D
- x1: float
- y1: float
- x2: float
- y2: float;

**Methods**
- display(): void
- intersects(Segment2D): boolean

---

# Hypha
**Fields**
- parent: Hypha
- children: ArrayList<Hypha>
orientation angle
colour inherited from root

Mycelium
reference to root
tree of apices originating from root
method to grow all apices

HyphaeSubstrate
grid with null Hypha references
method to populate grid
method to display all pixels
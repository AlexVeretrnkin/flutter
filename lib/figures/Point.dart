class Point {
  double x, y;

  Point(this.x, this.y);

  Point.origin() {
    x = 0;
    y = 0;
  }

  void printPoint() {
    print('X: ${this.x}, Y: ${this.y}');
  }

  bool operator ==(Object p) => p is Point && p.x == x && p.y == y;

  @override
  int get hashCode => super.hashCode;
}
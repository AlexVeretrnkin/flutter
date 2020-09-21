class Rectangle {
  int _width = 0;
  int _height = 0;

  Rectangle(this._height, this._width);

  Rectangle.origin() : this(0, 0);

  int get width {
    print('Getting width');

    return _width;
  }

  int get height => _height;

  set width(int w) => w > 0 ? _width = w : 0;
  set height(int h) => h > 0 ? _height = h : 0;

  int getArea() => _width * _height;

  @override
  String toString() {
    return 'Width: $width, Height: $height';
  }
}
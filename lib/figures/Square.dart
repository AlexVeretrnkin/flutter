import 'package:mobile_app_flutter/figures/Rectangle.dart';

class Square extends Rectangle {
  Square(int size) : super(size, size);

  Square.origin() : this(0);

  @override
  int getArea() {
    return super.getArea();
  }

  @override
  String toString() {
    return 'Square - ${super.toString()}';
  }
}
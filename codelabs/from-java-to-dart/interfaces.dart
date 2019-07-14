import 'dart:math';

abstract class Shape {
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class CircleMock implements Circle {
  num area;
  num radius;
}

printCircle(Circle circle) {
  print('This circle\'s area: ${circle.area} and its radius is ${circle.radius}');
}

main() {
  final CircleMock circleMock = CircleMock();
  circleMock.radius = 5;
  circleMock.area = 3;
  // No errors, nada, it is valid as CircleMock implements Circle
  printCircle(circleMock);
}

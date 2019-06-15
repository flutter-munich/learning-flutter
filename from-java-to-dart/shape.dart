const pi = 3.14;

abstract class Shape {
  num get area;

  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(4);
    throw 'Cannot create shape with type $type';
  }
}

class Circle implements Shape {
  final num radius;

  Circle(this.radius);

  num get area => radius * radius * pi;
}

class Square implements Shape {
  final num side;

  Square(this.side);

  num get area => side * side;
}

Shape shapeFactory(String type) {
  if (type == 'circle') return Circle(2);
  if (type == 'square') return Square(4);
  throw 'Cannot create shape with type $type';
}

main() {
  final circle = Circle(3);
  final square = Square(6);
  print(circle.area);
  print(square.area);
  
  // Use the factory constructor to create a circle
  final shape = Shape('circle');
  print(shape.area);

  // This will throw an exception because the parameter string is invalid
  final shapeFromFunction = shapeFactory('invalid shape');
  // Unhandled exception: Cannot create shape with type invalid shape
}
# Intro to Dart for Java Developers

> [This folder is based on the "Intro to Dart for Java Developers" codelab](https://codelabs.developers.google.com/codelabs/from-java-to-dart)

* Dart is the programming language for Flutter.
* You can run the examples in [DartPad](https://dartpad.dartlang.org/) or in an IDE (e.g. [Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code))

## Create a simple Dart class

See [`bicycle.dart`](./bicycle.dart) for more details.

In Dart,

* You can define code outside of classes (unlike Java, where everything is a class).
* All identifiers are public by default.
* There's no `public`, `protected`, `private` keywords.
* Indent with 2 spaces.
* `dartfmt` autoformats your code.
* Constructors don't need a body.
* Using `this` in a constructor's parameter list is a handy shortcut for assigning values to instance variables.
* `new` is optional.
* If you know that a variable's value won't change, you can use `final` instead of `var`.
* Analyzer infers that `var bike = Bicycle(...)` defines a Bicycle instance.
* Use `@override` to explicitly say that you **want to override** smoething. If it's not an overrideable method, the analyzer complains.
* Strings can be specified with single and double quotes
* String interpolation: `'$variable'`
* Uninitialized variables (even numbers) have the value `null`
* Implicit getters and setters are provided for all public instance variables.
* Define custom setters, getters if you want to enforce read-only or write-only variables, compute or verify a value, or update a value elsewhere.
* Start with a simple field and refactor it later if needed to setters and getters accessing a private field: The API stays the same.

## Use optional parameters (instead of overloading)

See [`rectangle.dart`](./rectangle.dart) for more details.

Compare the constructors in Java with Dart.

### Java

```java
public class Rectangle {
    public int width = 0;
    public int height = 0;
    public Point origin;

    // four constructors
    public Rectangle() {
        origin = new Point(0, 0);
    }
    public Rectangle(Point p) {
        origin = p;
    }
    public Rectangle(int w, int h) {
        origin = new Point(0, 0);
        width = w;
        height = h;
    }
    public Rectangle(Point p, int w, int h) {
        origin = p;
        width = w;
        height = h;
    }
    // Rest of the class
}
```

### Dart

```dart
class Rectangle {
  int width;
  int height;
  Point origin;

  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});
}
```

Dart constructor uses optional named parameters.

* we assign instance variables inside a constructor's declaration by using the `this` keyword.
* All parameters are optional named parameters. Named parameters are enclosed in curly braces `({})`.
* The `this.origin = const Point(0, 0)` syntax specifies a default value of `Point(0,0)` for the `origin` instance variable. The specified default must be a compile-time constant. This constructor supplies default values for all three instance variables.

All of these instantiations are valid:

```dart
Rectangle(origin: const Point(10, 20), width: 100, height: 200);
Rectangle(origin: const Point(10, 10));
Rectangle(width: 200);
Rectangle();
```

## Create a factory

See [`shape.dart`](./shape.dart) for more details.

Factory is a design pattern commonly used in Java. The pattern is used to:
* Hide details of instantiation
* Return a subtype of the factory's return type
* Return an existing object rather than a new object

In Dart, there are multiple ways to implement a factory:
1. Top-level function
2. Factory constructor

In this example, a `Shape` has an `area`. There are multiple shapes: `Square`, `Circle`.


```dart
abstract class Shape {
  num get area;
}

class Circle implements Shape { /* ... */ }
class Square implements Shape { /* ... */ }
```

* You can define multiple classes in one file
* `dart:math` is one of Dart's core library (which I decided not to use in the example)
* in Dart 2, core library constants are lowercase (why?)
* getters can return fields or calculate a value, for example `num get area => r * r * pi;`

Alright, so we have two different classes that implement `Shape`.

Now, it's tim to create the factories.

### Top-level function

The first way is to use a top level function.

```dart
Shape shapeFactory(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(4);
    throw 'Cannot create shape with type $type';
}
```

### Factory constructor

```dart
abstract class Shape {
  num get area;

  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(4);
    throw 'Cannot create shape with type $type';
  }
}
```

### Exceptions

* Use common exceptions: Dart SDK defines classes for many common exceptions
* Extend the `Exception` class to create your own, more specific, eception
* Just throw a string? It's the lazy way

If you don't catch the exception:

```
Unhandled exception:
Cannot create shape with type invalid shape
```

## Implement an interface

See [`interfaces.dart`](./interfaces.dart) for more details.

The `interface` keyword doesn't exist in Dart: every class defines an interface.
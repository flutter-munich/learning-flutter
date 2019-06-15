# Intro to Dart for Java Developers

> [This folder is based on the "Intro to Dart for Java Developers" codelab](https://codelabs.developers.google.com/codelabs/from-java-to-dart)

* Dart is the programming language for Flutter.
* You can run the examples in [DartPad](https://dartpad.dartlang.org/) or in an IDE (e.g. [Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code))

## Create a simple Dart class

```dart

class Bicycle {
  // Instance variables.
  // Notice: no private keyword
  int cadence;
  int speed;
  int gear;
  // Constructor has no body, and that's OK in Dart
  Bicycle(this.cadence, this.speed, this.gear);
}
```

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

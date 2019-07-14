# Write Your First Flutter App

## Part 1

### [Create the initial Flutter app](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1/#2)

First, we create an app with project name `startup_namer`. 

```
$ flutter create --project-name startup_namer .
```

Then, I launch one of the emulators I have locally. You need to install one emulator or you can use a real device, too.

```
$ flutter emulators
2 available emulators:

Pixel_API_28        • pixel         • Google • Pixel API 28
apple_ios_simulator • iOS Simulator • Apple

To run an emulator, run 'flutter emulators --launch <emulator id>'.
$ flutter emulators --launch Pixel_API_28
## You should see the emulator open on your computer
$ flutter devices
1 connected device:
Android SDK built for x86 • emulator-5554 • android-x86 • Android 9 (API 28) (emulator)
```

Now, it's time to launch the example app. You'll need to wait a bit, but after the app has started, hot-reload will refresh the view in less than a second (~250 ms).

```
flutter run
```

We replace the original counter app with a simple Hello World container:

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: const Text('Hello World'),
        ),
      ),
    );
  }
}
```

You can format your code automatically:

```
$ flutter format lib
Formatting directory lib:
Formatted main.dart
```

#### Observations

* The main method uses arrow (=>) notation, Use arrow notation for one-line functions or methods.
* In Flutter, almost everything is a widget: even the app's just a widget
* The scaffold provides a default app bar, title and body.
* The widget provides a `build` method that describes how to display the widget

### [Use an external package](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1/#3)

[`pub.dev`](https://pub.dev) contains open source packages. We install the `english_words` package that contains English words with some utility functions.

In `lib/main.dart`, we import the new package by adding this line:

```
import 'package:english_words/english_words.dart';
```

### [Add a stateful widget](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1/#4)

*Stateless* widgets are immutable: their properties cannot change.

*Stateful* widgets maintain state that might change during the lifetime of the widget. To implement a stateful widget: create a state and a stateful widget.

The stateful widget class itself is immutable, but the state persists over the lifetime of the widget.

We are creating a stateful widget. The state will save and generate random word pairs as the user scrolls through the app.

### [Create an infinite scrolling `ListView`](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1/index.html?index=..%2F..index#5)

Instead of displaying only one random word-pair, we display an infinite list of random words. `ListView`'s `builder` factory constructor allows you to build a list view lazily, on demand.

The `ListView.builder` factory constructor takes an `itemBuilder` argument. Two parameters are passed to this function, the context and the row iterator index.

Everytime we run out of suggested random word pairs, the builder function will create more random word pairs.

## Part 2

### [Add ❤️ icons to the list](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2/index.html?index=..%2F..index#3)

We add heart icons to the list item, so that in the next step (after handling user interaction) we can save words as favorites.

To do so, we use the `ListTile`'s `trailing` argument that expect a widget: we provide here the filled or outlined versions of the heart icon, depending on whether the word was already favorited by the user.

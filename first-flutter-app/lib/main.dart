import 'package:flutter/material.dart';


// Use the fat-arrow notation for one-line functions
void main() => runApp(MyApp());

// In Flutter, almost everything is a widget. even the app is just a widget
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

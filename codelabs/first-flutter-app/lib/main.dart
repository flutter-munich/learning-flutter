import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// Use the fat-arrow notation for one-line functions
void main() => runApp(MyApp());

// In Flutter, almost everything is a widget. even the app is just a widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Write Your First Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random words'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}


// This widget does very little: it just creates its state
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

// This is the state that belong to the stateful widget RandomWords.
// State<RandomWords> indicates that we use the generic state class
// for use with RandomWords widget
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wp = WordPair.random();
    return Text(wp.asPascalCase);
  }
}
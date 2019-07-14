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
        body: RandomWords(),
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

  // for saving suggested word pairs
  final List<WordPair> _suggestions = <WordPair>[];


  // Make font size larger
  final TextStyle _biggerFont = const TextStyle(fontSize: 18); 


  /// Build a row using the word pair: [pair]
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  /// Build a list of suggestions.
  ///
  /// It uses the ListView.builder to build items lazily and creating
  /// an infinitely scrollable list.
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        // Add a divider widget before each row in the ListView.
        // A divider is a grey horizontal rule.
        if (i.isOdd) return Divider();
        // The syntax "i ~/ 2" divides i by 2 and returns an
        // integer result.
        // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
        // This calculates the actual number of word pairings
        // in the ListView,minus the divider widgets.
        final index = i ~/ 2;
        // If you've reached the end of the available word
        // pairings...
        if (index >= _suggestions.length) {
          // ...then generate 10 more and add them to the
          // suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}

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
      home: RandomWords(),
      debugShowCheckedModeBanner: false,
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
  // For storing suggested word pairs (the startup name suggestions)
  final List<WordPair> _suggestions = <WordPair>[];

  // This set stores the word pairings that the user favorited.
  // We use sets because set automatically handles duplicates:
  // in a set, no duplicates are allowed.
  // Liked, heart, favorited, saved are all the same:
  // the user liked a startup name
  final Set<WordPair> _favorites = Set<WordPair>();

  // Make font size larger
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  void _pushFavorites() {
    Navigator.of(context).push(
      // <void> as it doesn't return a value
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Favorite startup names'),
            ),
            body: ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: _favorites.map((wordpair) {
                  return ListTile(
                    title: Text(
                      wordpair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                }),
              ).toList(),
            ),
          );
        },
      ),
    );
  }

  /// Build a row using the word pair: [pair]
  Widget _buildRow(WordPair pair) {
    // We could also write final bool isFavorite, but the type is inferred,
    // so we can also omit the type declaration.
    // Let's see if the word pair was already favorited:
    final isFavorite = _favorites.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      // When favorite, fill the heart icon, when it's not favorite,
      // just display the outlined heart icon
      trailing: isFavorite
          ? Icon(Icons.favorite, color: Colors.red)
          : Icon(Icons.favorite_border),
      onTap: () {
        setState(() {
          if (isFavorite) {
            _favorites.remove(pair);
          } else {
            _favorites.add(pair);
          }
        });
      },
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
    return Scaffold(
      appBar: AppBar(title: const Text('Random words'), actions: [
        IconButton(
          icon: Icon(Icons.list),
          onPressed: _pushFavorites,
        )
      ]),
      body: _buildSuggestions(),
    );
  }
}

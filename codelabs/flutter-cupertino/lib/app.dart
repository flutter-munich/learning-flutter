import 'package:flutter/cupertino.dart';

// We can centralize style definitions in a way that is similar to how
// web developers centralize their style markup in CSS files by grouping
// all of our definitions in a single file. This gives us the easiest way
// to reuse and redefine styles across the whole app.
import 'styles.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CupertinoApp provides theming, navigation, text direction,
    // and other defaults required to create an app that an iOS user expects.
    return CupertinoApp(
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CupertinoPageScaffold supports single pages and accepts a
    // Cupertino-style navigation bar, background color, and holds
    // the widget tree for the page. 
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Store'),
      ),
      child: Container(),
    );
  }
}

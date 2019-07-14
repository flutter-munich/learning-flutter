import 'package:flutter/cupertino.dart';

// We can centralize style definitions in a way that is similar to how
// web developers centralize their style markup in CSS files by grouping
// all of our definitions in a single file. This gives us the easiest way
// to reuse and redefine styles across the whole app.
import 'styles.dart';

import 'product_list_tab.dart';
import 'search_tab.dart';
import 'shopping_cart_tab.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CupertinoApp provides theming, navigation, text direction,
    // and other defaults required to create an app that an iOS user expects.
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
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

    // CupertinoTabScaffold
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Product'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Cart'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ProductListTab(),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: SearchTab(),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ShoppingCartTab(),
                );
              },
            );
        }
      },
    );
  }
}

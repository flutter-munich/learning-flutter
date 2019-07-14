import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';

// The shopping cart tab is a stateful widget because it maintains
// the list of purchases and the customer's info.
class ShoppingCartTab extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() {
    return _ShoppingCartTabState();
  }
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        // This page uses a CustomScrollView
        return CustomScrollView(
          slivers: const <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Shopping Cart'),
            ),
          ],
        );
      },
    );
  }
}

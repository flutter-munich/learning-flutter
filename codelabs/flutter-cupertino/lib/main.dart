// Import the Cupertino package. This makes all the Cupertino widgets and
// constants available to your app.
import 'package:flutter/cupertino.dart';
// Import the services library. This makes the platform services, like the
// clipboard and setting the device orientation, available to your app.
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'app.dart';

import 'model/app_state_model.dart';

void main() {
  // This app is designed only to work vertically, so we limit
  // orientations to portrait up and down.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(
    // We are wiring the AppStateModel at the top of the widget tree
    // to make it available throughout the entire app.
    ChangeNotifierProvider<AppStateModel>(
      // !!! Different in the tutorial: instead of
      // model:model
      // we need to provide a builder method
      builder: (_) => AppStateModel()..loadProducts(),
      child: CupertinoStoreApp(),
    ),
  );
}

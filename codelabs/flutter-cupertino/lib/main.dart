// Import the Cupertino package. This makes all the Cupertino widgets and
// constants available to your app.
import 'package:flutter/cupertino.dart';
// Import the services library. This makes the platform services, like the
// clipboard and setting the device orientation, available to your app.
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  // This app is designed only to work vertically, so we limit
  // orientations to portrait up and down.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(CupertinoStoreApp());
}
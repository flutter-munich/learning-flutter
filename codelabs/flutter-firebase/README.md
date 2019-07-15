# Firebase for Flutter

## [Introduction](https://codelabs.developers.google.com/codelabs/flutter-firebase/index.html#1)

 Firebase gives you access to backend services for mobile applications—including authentication, storage, database, and hosting—without maintaining your own servers.

 * the app accesses vote counts for baby names from a database (Firestore)
 * the user taps on a name and updates the database using a transaction

Then, we set up Firebase...

## [Connect your Flutter app to Cloud Firestore](https://codelabs.developers.google.com/codelabs/flutter-firebase/index.html#8)

From Dart, you get the reference to Cloud Firestore by calling `Firestore.instance`. For example, `Firestore.instance.collection('baby').snapshots()` returns a stream of snapshots.

We used a `StreamBuilder` that loads a list of names from Firebase and displays its value.

## [Add interactivity](https://codelabs.developers.google.com/codelabs/flutter-firebase/index.html#9)

We increment the vote count `onTap`. The update is not run in a transaction and we could miss votes due to race conditions.

## [Use a Cloud Firestore transaction](https://codelabs.developers.google.com/codelabs/flutter-firebase/index.html#10)

We wrap the update in a transaction to make sure we don't miss votes.

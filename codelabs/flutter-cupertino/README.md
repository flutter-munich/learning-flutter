# [Building a Cupertino app with Flutter](https://codelabs.developers.google.com/codelabs/flutter-cupertino/index.html?index=../..index#0)

In this codelab

**We create**

> Cupertino style shopping app containing three tabs: one for the product list, one for a product search, and one for the shopping cart.

**We learn**

* How to build a Flutter app with an iOS style look and feel.
* How to create multiple tabs and navigate between them.
* How to use the provider package to manage state between screens.

## [Create the initial `cupertino` app](https://codelabs.developers.google.com/codelabs/flutter-cupertino/index.html?index=../..index#2)

```
$ flutter create --template app --org flutter_cupertino.codelabs.dev.dartside --project-name flutter_cupertino .
```

* separate file for styles: [styles.dart](lib/styles.dart)
* `CupertinoApp` provides theming, navigation, text direction, and other defaults required to create an app that an iOS user expects.
* `CupertinoPageScaffold` supports single pages and accepts a navigation bar, background color, and holds the widget tree for the page

## [Create structure for a 3-tab app](https://codelabs.developers.google.com/codelabs/flutter-cupertino/index.html?index=../..index#3)

Create skeleton of the app:
* tab scaffold with tab bar and tab builder
* tab builder builds different tab views
* each of the tab views contain a page scaffold
* the page scaffolds have a child widget that corresponds to the tab's content

**At the end of this step, the app is not compiling, so continue to the next step immediately**.

## [Add state management](https://codelabs.developers.google.com/codelabs/flutter-cupertino/index.html?index=../..index#4)

`ProductsRepository` in this case is a mock product database. We are making a mock product database for ease of development, but this should be served to the app as an API. An easy way to do this that deals with the partially disconnected reality of mobile phones is Cloud Firestore.

* `AppStateModel` shows a way of centralizing the state of the application, and making the state available throughout the whole application

## [List products for sale(https://codelabs.developers.google.com/codelabs/flutter-cupertino/index.html?index=../..index#5)

* `CupertinoSliverNavigationBar` is how we get iOS 11 style expanding titles in the navigation bar. This is important to make an iOS user feel at home in the app.

**TODO: Mistakes in codelab**

```dart
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
```

```dart
class ProductListTab extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return CupertinoPageScaffold(
     child: Consumer<AppStateModel>(
       builder: (context, value, child) {
         // TODO: builder changed
         final products = value.getProducts();
```

## [Add product search](https://codelabs.developers.google.com/codelabs/flutter-cupertino/index.html?index=../..index#6)

**TODO: Mistakes in codelab**

```dart
import 'missing-semicolons.dart'
```

## [Add customer info](https://codelabs.developers.google.com/codelabs/flutter-cupertino/index.html?index=../..index#7)

## [Add date picker](https://codelabs.developers.google.com/codelabs/flutter-cupertino/index.html?index=../..index#8)

## [Add selected items for purchase](https://codelabs.developers.google.com/codelabs/flutter-cupertino/index.html?index=../..index#9)

**TODO: Mistakes in codelab**

`ShoppingCartItem` is missing from the tutorial. Readers need to look up the widget definition from GitHub.

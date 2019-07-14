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

import 'package:flutter/widgets.dart';

/// i use this calss to handle the app context
/// and navigator context from anywhere in the app

class CurrentApp {
  CurrentApp._();

  static final GlobalKey appKey = GlobalKey();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => appKey.currentContext!;
  static BuildContext get navigatorContext => navigatorKey.currentContext!;
}

import 'package:flutter/widgets.dart';

class CurrentApp {
  CurrentApp._();

  static final GlobalKey appKey = GlobalKey();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => appKey.currentContext!;
  static BuildContext get navigatorContext => navigatorKey.currentContext!;
}

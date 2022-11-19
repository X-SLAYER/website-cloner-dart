import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String resetPassword = '/resetPassword';
  static const String changePassword = '/change_password';

  static final routes = <String, WidgetBuilder>{
    // home: (BuildContext context) => HomePage(),
  };
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_updated_boilerplate/data/locale/general_context.dart';
import 'package:flutter_updated_boilerplate/utils/animations/route_transation.dart';

import 'hex_color.dart';

hideStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: <SystemUiOverlay>[]);
}

revertStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: <SystemUiOverlay>[SystemUiOverlay.bottom, SystemUiOverlay.top]);
}

changeStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: HexColor('#E2EDF8'),
        statusBarIconBrightness: Brightness.dark),
  );
}

Future<dynamic> pushScreen(Widget page) async {
  Navigator.push(
      CurrentApp.navigatorContext, MaterialPageRoute(builder: (ctx) => page));
}

Future<dynamic> pushScreenWithTransitions(
    Widget page, AnimationType animation) async {
  return await Navigator.of(CurrentApp.navigatorContext).push(
      PageRouteTransition(animationType: animation, builder: (ctx) => page));
}

Future<dynamic> pushReplaceScreenWithTransitions(
    Widget page, AnimationType animation) async {
  Navigator.of(CurrentApp.navigatorContext).pushReplacement(
      PageRouteTransition(animationType: animation, builder: (ctx) => page));
}

Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
  Navigator.of(CurrentApp.navigatorContext)
      .pushNamed(routeName, arguments: arguments);
}

Future<dynamic> pushReplaceScreen(Widget page) async {
  Navigator.pushReplacement(
      CurrentApp.navigatorContext, MaterialPageRoute(builder: (ctx) => page));
}

Future<dynamic> pushRemoveUntil(String route) async {
  Navigator.of(CurrentApp.navigatorContext)
      .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
}

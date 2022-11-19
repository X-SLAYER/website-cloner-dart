import 'package:flutter/material.dart';

class ColorBrightness {
  late Color _color;

  ColorBrightness(Color color) {
    _color = Color.fromARGB(color.alpha, color.red, color.green, color.blue);
  }

  bool get isDark => getBrightness() < 128.0;

  bool get isLight => !isDark;

  Brightness get matchedBrightness =>
      isLight ? Brightness.dark : Brightness.light;

  double getBrightness() {
    return (_color.red * 299 + _color.green * 587 + _color.blue * 114) / 1000;
  }
}

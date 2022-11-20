import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme extends ChangeNotifier {
  bool isLightTheme = true;

  ThemeData get getThemeData => isLightTheme ? themeData : themeDataDark;

  setThemeData(bool val) {
    isLightTheme = val;
    notifyListeners();
  }

  final ThemeData themeData = ThemeData(
    fontFamily: GoogleFonts.quicksand().fontFamily,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF54B689),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color(0xFF54B689),
          brightness: Brightness.light,
        ),
    backgroundColor: Colors.white,
  );

  final ThemeData themeDataDark = ThemeData(
    fontFamily: GoogleFonts.roboto().fontFamily,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF5b3ab9),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color.fromRGBO(0, 68, 105, 1),
          brightness: Brightness.dark,
        ),
  );
}

import 'package:flutter/material.dart';

class AppLocalization extends ChangeNotifier {
  Locale _locale = const Locale('fr');
  String selectedLanguageCode = 'fr';

  Locale get getLocale => _locale;

  toggleLocal(Locale locale) {
    _locale = locale;
    selectedLanguageCode = locale.toLanguageTag();
    notifyListeners();
  }
}

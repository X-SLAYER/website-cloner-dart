import 'package:flutter_updated_boilerplate/stores/language/app_localization.dart';
import 'package:flutter_updated_boilerplate/stores/providers/app_theme.dart';
import 'package:flutter_updated_boilerplate/stores/providers/connectivity_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  Providers._();

  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider.value(
      value: ConnectivityProvider(),
    ),
    ChangeNotifierProvider.value(
      value: AppLocalization(),
    ),
    ChangeNotifierProvider.value(
      value: AppTheme(),
    ),
  ];
}

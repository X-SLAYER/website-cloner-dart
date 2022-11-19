import 'package:flutter_updated_boilerplate/data/locale/general_context.dart';
import 'package:flutter_updated_boilerplate/providers.dart';
import 'package:flutter_updated_boilerplate/routers.dart';
import 'package:flutter_updated_boilerplate/stores/language/app_localization.dart';
import 'package:flutter_updated_boilerplate/stores/language/store.dart';
import 'package:flutter_updated_boilerplate/stores/providers/app_theme.dart';
import 'package:flutter_updated_boilerplate/ui/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: Providers.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLocalization>(
      builder: (ctx, localization, child) => Consumer<AppTheme>(
        builder: (_, themeProvider, __) => MaterialApp(
          key: CurrentApp.appKey,
          navigatorKey: CurrentApp.navigatorKey,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('fr', 'FR'),
            Locale('en', 'US'),
            Locale('ar', 'TN'),
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            return Locale(localization.selectedLanguageCode);
          },
          debugShowCheckedModeBanner: false,
          title: 'iheb-boilerplate',
          theme: themeProvider.getThemeData,
          home: const HomePage(),
          routes: Routes.routes,
        ),
      ),
    );
  }
}

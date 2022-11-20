import 'dart:io';

import 'package:flutter_updated_boilerplate/data/locale/general_context.dart';
import 'package:flutter_updated_boilerplate/providers.dart';
import 'package:flutter_updated_boilerplate/routers.dart';
import 'package:flutter_updated_boilerplate/stores/language/store.dart';
import 'package:flutter_updated_boilerplate/ui/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Website Cloner By X-SLAYER');
    setWindowMaxSize(const Size(639.0, 500.0));
    setWindowMinSize(const Size(639.0, 500.0));
  }
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
    return MaterialApp(
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
      debugShowCheckedModeBanner: false,
      title: 'Website Cloner By X-SLAYER',
      theme: ThemeData(
        fontFamily: GoogleFonts.quicksand().fontFamily,
        brightness: Brightness.light,
        primaryColor: const Color(0xFF54B689),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFF54B689),
              secondary: const Color(0xFF439C9D),
              brightness: Brightness.light,
            ),
        backgroundColor: Colors.white,
      ),
      home: const HomePage(),
      routes: Routes.routes,
    );
  }
}

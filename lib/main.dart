import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:website_cloner/data/locale/general_context.dart';
import 'package:website_cloner/routers.dart';
import 'package:website_cloner/ui/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Website Cloner By X-SLAYER');
    setWindowMaxSize(const Size(639.0, 500.0));
    setWindowMinSize(const Size(639.0, 500.0));
  }
  doWhenWindowReady(() {
    const initialSize = Size(639.0, 500.0);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.minSize = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      key: CurrentApp.appKey,
      navigatorKey: CurrentApp.navigatorKey,
      localizationsDelegates: const [
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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFF54B689),
              secondary: const Color(0xFF439C9D),
              brightness: Brightness.light,
              background: Colors.white,
            ),
      ),
      home: const HomePage(),
      routes: Routes.routes,
    );
  }
}

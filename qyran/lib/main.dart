import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qyran/api/entity/enums/UserRole.dart';
import 'package:qyran/auth/login_page.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/main/splash_view.dart';
import 'package:qyran/main_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/welcome/welcome_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'generated/l10n.dart';

void main() {
  initRestClient();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _mainNavigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ResponsiveSizer(builder: (_, __, ___) {
      return MaterialApp(
        navigatorKey: _mainNavigatorKey,
        title: 'Qyran',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        supportedLocales: const [Locale('ru', ''), Locale('kk', '')],
        locale: const Locale("kk", ''),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xffF5F5F8),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF5F5F8)),
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
        home: SplashView(),
      );
    });
  }
}

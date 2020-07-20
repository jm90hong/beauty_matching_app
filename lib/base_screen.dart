import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/screens/main_screen.dart';
import 'package:beautymatchingapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'beauty_matching_app',
      theme: ThemeData(
        fontFamily: 'ng',
        primarySwatch: kAppMainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ko', 'KO'),
      ],
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        MainScreen.id: (context) => MainScreen(),
      },
    );
  }
}


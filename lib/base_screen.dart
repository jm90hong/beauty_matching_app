import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';


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
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}


import 'package:beautymatchingapp/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'models/location_model.dart';
import 'models/user_model.dart';

//todo main.dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => LocationModel()),
      ],
      child: MaterialApp(
        home:BaseScreen(),
      ),
    );
  }
}


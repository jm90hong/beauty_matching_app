import 'package:beautymatchingapp/vo/session.dart';
import 'package:flutter/material.dart';



class MainScreen extends StatefulWidget {
  static const id = 'main';

  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          height:double.infinity,
          width: double.infinity,
          child: Text('main page ${Session.loginProvider} ${Session.loginId} ${Session.nickname}'),
        ),
      ),
    );
  }
}

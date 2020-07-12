import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/material.dart';

//TODO my찜
class MainPage3 extends StatefulWidget {
  @override
  _MainPage3State createState() => _MainPage3State();
}

class _MainPage3State extends State<MainPage3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width:double.infinity,
              height:45,
              child:Text('my찜',style: AppTextStyles.appBarTitleTextStyle,)
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

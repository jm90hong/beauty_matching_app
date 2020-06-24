import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/screens/pages/main_page1.dart';
import 'package:beautymatchingapp/screens/pages/main_page2.dart';
import 'package:beautymatchingapp/screens/pages/main_page3.dart';
import 'package:beautymatchingapp/screens/pages/main_page4.dart';
import 'package:beautymatchingapp/vo/session.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main';

  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex=0;
  List<Widget> _pages=[
    MainPage1(), // todo 홈
    MainPage2(), // todo 내주변
    MainPage3(), // todo my찜
    MainPage4(), // todo 내정보
  ];

  double bottomNavIconSize = 20;
  TextStyle bottomNavTextStyle=TextStyle(fontWeight: FontWeight.normal,color: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:IndexedStack(
          index:_currentPageIndex,
          children:_pages,
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentPageIndex,
        selectedItemColor: kAppMainColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize:11,
        unselectedFontSize:11,
        items: [

          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circle,size:bottomNavIconSize,),
            title: Padding(
                padding: EdgeInsets.only(top:4),
                child: Text('홈',style: bottomNavTextStyle)
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.mapMarkerAlt,size:bottomNavIconSize,),
            title: Padding(
                  padding: EdgeInsets.only(top:4),
                  child: Text('내주변',style: bottomNavTextStyle)
                ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.star,size:bottomNavIconSize),
            title: Padding(
                padding: EdgeInsets.only(top:4),
                child: Text('my찜',style: bottomNavTextStyle)),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user,size:bottomNavIconSize),
            title: Padding(
                padding: EdgeInsets.only(top:4),
                child: Text('마이페이지',style: bottomNavTextStyle)),
          )
        ],
        onTap: (index){
          setState(() {
            _currentPageIndex=index;
          });
        },
      ),

    );
  }
}

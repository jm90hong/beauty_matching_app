import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/screens/pages/main_page1.dart';
import 'package:beautymatchingapp/screens/pages/main_page2.dart';
import 'package:beautymatchingapp/screens/pages/main_page3.dart';
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
    MainPage1(),
    MainPage2(),
    MainPage3(),
  ];

  double bottomNavIconSize = 20;

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
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.mapMarkerAlt,size:bottomNavIconSize,),
            title: Padding(
                  padding: EdgeInsets.only(top:4),
                  child: Text('내주변',style: TextStyle(fontWeight: FontWeight.bold),)
                ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border,size:bottomNavIconSize+3),
            title: Padding(
                padding: EdgeInsets.only(top:4),
                child: Text('my찜',style: TextStyle(fontWeight: FontWeight.bold),)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,size:bottomNavIconSize+3),
            title: Padding(
                padding: EdgeInsets.only(top:4),
                child: Text('내정보' ,style: TextStyle(fontWeight: FontWeight.bold),)),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user,size:bottomNavIconSize),
            title: Padding(
                padding: EdgeInsets.only(top:4),
                child: Text('내정보',style: TextStyle(fontWeight: FontWeight.bold),)),
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

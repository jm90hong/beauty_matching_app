import 'package:badges/badges.dart';
import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/screens/pages/main_page_home.dart';
import 'package:beautymatchingapp/screens/pages/main_page_around_me.dart';
import 'package:beautymatchingapp/screens/pages/main_page_my_like.dart';
import 'package:beautymatchingapp/screens/pages/main_page_mypage.dart';
import 'package:beautymatchingapp/screens/pages/main_page_realtime.dart';
import 'package:beautymatchingapp/vo/session.dart';
import 'package:flutter/cupertino.dart';
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
    MainPageHome(), // todo 홈
    MainPageAroundMe(), // todo 내주변
    MainPageRealTime(),
    MainPageMyLike(), // todo my찜
    MainPageMyPage(), // todo 내정보
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
            icon: Badge(
                badgeContent: Text('2',style: TextStyle(fontSize:10,fontWeight: FontWeight.bold,color: Colors.white),),
                badgeColor: Color(0xffff3b27),
                child: Icon(FontAwesomeIcons.list,size:bottomNavIconSize)
            ),
            title: Padding(
                padding: EdgeInsets.only(top:4),
                child: Text('요청/승인',style: bottomNavTextStyle)),
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

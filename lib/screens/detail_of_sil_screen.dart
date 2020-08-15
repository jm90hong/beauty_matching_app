import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:beautymatchingapp/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DetailOfSilScreen extends StatefulWidget {
  final String shopName;
  DetailOfSilScreen({this.shopName});
  @override
  _DetailOfSilScreenState createState() => _DetailOfSilScreenState();
}

class _DetailOfSilScreenState extends State<DetailOfSilScreen> with SingleTickerProviderStateMixin {
  bool _isScrollMoveDown=false;
  var _pageScrollController=ScrollController();
  var _scPos;

  Color appbarBackgroundColor;
  Color appbarWidgetColor;
  Color appbarStarColor;
  AnimationController _animationController;
  Animation<Color> backgroundColorAnimation;
  Animation<Color> widgetColorAnimation;
  Animation<Color> starColorAnimation;
  Animation<Color> titleColorAnimation;



  //todo STYLES
  TextStyle _bigTS = TextStyle(color: Colors.black,
      fontSize:20,fontWeight: FontWeight.bold,fontFamily: 'ns');

  List<String> _imageList = [
    'https://t1.daumcdn.net/cfile/blog/120482504ED6DC0626',
    'https://i.pinimg.com/originals/ee/cb/7b/eecb7be750032305c0f5c0d300a088f3.jpg',
    'https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99691B4C5BFA9ACB0B'
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageScrollController.addListener(() {
      _scPos= _pageScrollController.position.pixels;
      _animationController.animateTo(_scPos/100);
    });

    _animationController = AnimationController(
      duration: Duration(seconds:0),
      vsync: this
    );

    backgroundColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.white
    ).animate(_animationController);

    titleColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.black
    ).animate(_animationController);

    widgetColorAnimation = ColorTween(
        begin: Colors.white,
        end: Colors.black
    ).animate(_animationController);

    starColorAnimation = ColorTween(
        begin: Colors.white,
        end: kAppMainColor
    ).animate(_animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageScrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height:MediaQuery.of(context).size.height,
              color: Colors.white,
              padding: EdgeInsets.only(top:0,left:0,right:0,bottom:0),
              child: SingleChildScrollView(
                controller: _pageScrollController,
                child: Column(
                  children: <Widget>[
                    //todo 관리실 이미지 케러셀 (최대 5장)
                    Container(
                      child: CarouselSlider(
                          options: CarouselOptions(
                              enlargeCenterPage: false,
                              height:250,
                              viewportFraction: 1.0
                          ),
                          items: _imageList.map(
                                  (image) =>
                                  Container(
                                      color: Colors.grey.shade200,
                                      child: Image.network(image,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,)
                                  )
                          ).toList()
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top:18,left: 8,right: 8),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width:MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal:20),
                              child: Text(widget.shopName,style: _bigTS,)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            //todo appbar
            AnimatedBuilder(
              animation: _animationController,
              builder: (context,child)=>OverlayingAppBar(
                backgroundColor:backgroundColorAnimation.value,
                widgetColor: widgetColorAnimation.value,
                starColor: starColorAnimation.value,
                titleColor: titleColorAnimation.value,
                title: widget.shopName,
                isLike: false,)
            )
          ],
        ),
      ),
    );
  }
}



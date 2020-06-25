import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/other/my_scroll_behavior.dart';
import 'package:beautymatchingapp/ui/card/sa_card.dart';
import 'package:beautymatchingapp/ui/card/sil_card.dart';
import 'package:beautymatchingapp/vo/session.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';



class MainPage1 extends StatefulWidget {
  @override
  _MainPage1State createState() => _MainPage1State();
}


class _MainPage1State extends State<MainPage1> {


  TextStyle helloTS = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize:16,
      color: Colors.black
  );
  TextStyle titleTS = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize:14,
      color: Colors.black
  );

  List<Widget> eventList = [
    Image.network('https://www.shinailbo.co.kr/news/photo/201910/1217075_470074_4054.jpg',fit:BoxFit.cover),
    Image.network('https://image.ajunews.com/content/image/2016/12/12/20161212084832640314.jpg',fit:BoxFit.cover),
    Image.network('https://post-phinf.pstatic.net/MjAyMDAyMDdfMjA3/MDAxNTgxMDY2MTk1ODEz.tyQDc90iX8KUaGBz91sBgSFzNvBkWsV0Ud4R17jy__8g.B48HjE_d01s8p2wNG0rVygS43ZkESnMPY2hUyWRVRKAg.JPEG/200206_%EC%97%AC%ED%96%89%EA%B0%80%EA%B2%8C_%EA%B3%B5%EB%AA%A8%EC%A0%84_%EC%B1%8C%EB%A6%B0%EC%A7%80_01_%EB%A9%94%EC%9D%B8_v5.jpg?type=w1200',fit:BoxFit.cover),
  ];
  List<Widget> silList = [];
  List<Widget> saList = [];



  CarouselOptions _carouselOptions = CarouselOptions(
    viewportFraction: 0.65,
    initialPage: 0,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayCurve: Curves.fastOutSlowIn,
  );

  Future<Position> getCurrentUserLocation() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((location) {
      return location;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding:EdgeInsets.only(top:8,left:10,right:10,bottom:2),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset('assets/images/logo/logo.png',width:30,),
                  ],
                ),
                SizedBox(height:30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${Session.nickname}님 안녕하세요.',style: helloTS,),
                          SizedBox(height:12,),
                          Text('어떠한 도움을 원하시나요?',style: helloTS,)
                        ],
                      ),
                    ),
                    Padding(
                        padding:EdgeInsets.only(right:12) ,
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/icon/default-user-icon.png',width:40,),
                            SizedBox(height:5,),
                            Text('관리사',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: kAppMainColor),)
                          ],
                        )
                    )
                  ],
                ),
                SizedBox(height:35,),
                Material(
                  color: Colors.grey.shade100,
                  borderRadius:  BorderRadius.all(Radius.circular(12)),
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical:13,horizontal:10),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color:Colors.grey.shade200,width: 0.4)
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '부산, 피부관리',
                              style:TextStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Text('오늘의 알림',style: titleTS,),
                SizedBox(height: 10,),
                //todo 이벤트 리스트
                _makeCarousel(eventList,heightRatio:0.46,widthFraction: 0.7,duration:4),
                SizedBox(height: 25,),
                Text('관리사님이 필요해요',style: titleTS,),
                SizedBox(height: 10,),
                //todo 모집중인 관리실 리스트
                //_makeCarousel([1,2,3,4,5]),
                SizedBox(height: 25,),
                Text('일을 할 수 있어요',style: titleTS,),
                SizedBox(height: 10,),
                //_makeCarousel([1,2,3,4,5]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _makeCarousel(List list,
      {@required double heightRatio,@required int duration,@required double widthFraction}
  ){
    print(list.length);
    return CarouselSlider(
      options: CarouselOptions(
        height:MediaQuery.of(context).size.width*heightRatio,
        viewportFraction: widthFraction,
        initialPage: 0,
        autoPlay: true,
        enlargeCenterPage: false,
        autoPlayInterval: Duration(seconds: duration),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items:list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.transparent
                ),
                child:i
            );
          },
        );
      }).toList(),
    );
  }
}

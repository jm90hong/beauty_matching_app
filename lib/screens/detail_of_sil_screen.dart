import 'package:beautymatchingapp/constant/app_config.dart';
import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:beautymatchingapp/main.dart';
import 'package:beautymatchingapp/screens/detail_of_request_screen.dart';
import 'package:beautymatchingapp/ui/card/request_form_sil_listtile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class DetailOfSilScreen extends StatefulWidget {
  final String heroTag;
  final String shopName;
  final bool isShowingRequest;

  DetailOfSilScreen({
    @required this.heroTag,
    @required this.shopName,
    @required this.isShowingRequest
  });
  @override
  _DetailOfSilScreenState createState() => _DetailOfSilScreenState();
}

class _DetailOfSilScreenState extends State<DetailOfSilScreen> with TickerProviderStateMixin {
  var _tabController;
  int _tabIndex=0;
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
      fontSize:24,fontWeight: FontWeight.bold,fontFamily: 'ns');

  TextStyle _infoTitleTS = TextStyle(color:Colors.grey,fontWeight: FontWeight.bold,fontSize:12);
  TextStyle _infoContentTS = TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize:13);


  List<String> _imageList = [
    'https://t1.daumcdn.net/cfile/blog/120482504ED6DC0626',
    'https://i.pinimg.com/originals/ee/cb/7b/eecb7be750032305c0f5c0d300a088f3.jpg',
    'https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99691B4C5BFA9ACB0B'
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this,length: 2);

    _pageScrollController.addListener(() {
      _scPos= _pageScrollController.position.pixels;
      _animationController.animateTo(_scPos/20);
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



  Widget _buildInfoBox({String title, String content}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            width:65,
            child: Text(title,style: _infoTitleTS,)
        ),
        SizedBox(width:20,),
        Flexible(child: Text(content,style: _infoContentTS))
      ],
    );
  }

  Widget _buildInfoBoxTags({String title, List<String> tags}){
    List<Widget> widgetList=[];
    tags.map((tag){
      var el = Container(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width:0.7),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Text(tag,style: TextStyle(color: Colors.grey,fontSize:11,fontWeight: FontWeight.bold),),
      );
      var sb = SizedBox(width:6,);
      widgetList.add(el);
      widgetList.add(sb);
    }).toList();



    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            width:65,
            child: Text(title,style: _infoTitleTS,)
        ),
        SizedBox(width:20,),
        Container(
          width: MediaQuery.of(context).size.width-135,
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 5,
            children: widgetList,
          ),
        )
      ],
    );
  }

  Widget _buildLocationMap({String title, String address}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            width:65,
            child: Text(title,style: _infoTitleTS,)
        ),
        SizedBox(width:20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width-140,
                child: Text(address,style: _infoContentTS)),
            SizedBox(height:10,),
            Container(
              width:MediaQuery.of(context).size.width-140,
              height:MediaQuery.of(context).size.width-140,
              child: WebView(
                initialUrl:AppConfig.geoServerUrl+'/map?address='+address,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            )
          ],
        )
      ],
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _pageScrollController.dispose();
    _tabController.dispose();
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
                    Hero(
                      tag: widget.heroTag,
                      child: Container(
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(widget.shopName,style: _bigTS,),
                                ],
                              )
                          ),
                          SizedBox(height:30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){

                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.phone,size:18,color:Color(0xff444444),),
                                    SizedBox(width:8,),
                                    Text('전화',style:TextStyle(color: Color(0xff444444),fontSize:16,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                              SizedBox(width:18,),
                              Container(height:18, child: VerticalDivider(color: Colors.grey.shade300,thickness: 1,)),
                              SizedBox(width:18,),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.star,size: 18,color: kAppMainColor,),
                                  SizedBox(width:8,),
                                  Text('찜 54',style: TextStyle(color: Color(0xff444444),fontSize:16,fontWeight: FontWeight.w600),),
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 30,),
                          Visibility(
                            visible: widget.isShowingRequest ? true : false,
                            child: TabBar(
                              labelPadding: EdgeInsets.only(bottom: 12),
                              labelColor: kAppMainColor,
                              unselectedLabelColor: Colors.grey,
                              onTap: (index){
                               setState(() {
                                 _tabIndex=index;
                               });
                              },
                              controller: _tabController,
                              tabs: <Widget>[
                                Text('정보',style: TextStyle(fontWeight: FontWeight.bold),),
                                Text('관리사 요청(2)',style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),

                          IndexedStack(
                            index: _tabIndex,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left:5,right: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(color:Colors.transparent,width:1),
                                    )
                                ),
                                child: Column(
                                  children: <Widget>[
                                    _buildInfoBox(title:'지역',content:'부산'),
                                    SizedBox(height:18,),
                                    _buildInfoBox(title:'영업시간',content:'평일 월-금 10:30~22:00\n주말 토요일 10:00~17:00'),
                                    SizedBox(height:18,),
                                    _buildInfoBox(title:'공휴일',content:'일요일'),
                                    SizedBox(height:18,),
                                    _buildInfoBoxTags(title: '간단소개',tags: ['역주변','주차가능','샤워시설','공기청정기','스타일러']),
                                    SizedBox(height:18,),
                                    _buildLocationMap(title:'주소',address:'부산 연제구 중앙대로 1001 1층'),

                                  ],
                                ),
                              ),

                              Container(
                                child: Column(
                                  children: <Widget>[
                                    RequestFromSilListTile(
                                      workType: 'day',
                                      workDate: '2020-08-18 화',
                                      shopName:'좋은 피부관리실',
                                      shopImageUrl:'https://t1.daumcdn.net/cfile/blog/120482504ED6DC0626',
                                      city: '부산',
                                      numberOfSa: 1,
                                      latitude: 34.1,
                                      longitude: 127.1,
                                      onTap: (){
                                        //todo 요청 상세 페이지로 이동...
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => DetailOfRequestScreen(
                                            shopImageUrl: 'https://t1.daumcdn.net/cfile/blog/120482504ED6DC0626',
                                            shopName: '좋은 피부관리실',
                                          )),
                                        );
                                      },
                                    ),

                                    RequestFromSilListTile(
                                      workType: 'term',
                                      workDate: '2020-08-18 화 ~ 2020-08-20 수',
                                      shopName:'좋은 피부관리실',
                                      shopImageUrl:'https://t1.daumcdn.net/cfile/blog/120482504ED6DC0626',
                                      city: '부산',
                                      numberOfSa: 1,
                                      latitude: 34.1,
                                      longitude: 127.1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )

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




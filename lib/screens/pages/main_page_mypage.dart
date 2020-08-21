import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:beautymatchingapp/screens/select_sa_or_sil_screen.dart';
import 'package:beautymatchingapp/vo/session.dart';
import 'package:flutter/material.dart';



//TODO 마이페이지
class MainPageMyPage extends StatefulWidget {
  @override
  _MainPageMyPageState createState() => _MainPageMyPageState();
}


class _MainPageMyPageState extends State<MainPageMyPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: MyAppBar(
        title: 'MY 페이지',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 20,left: 10,right: 10),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          CircleAvatar(
                            radius:40,
                            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ5T9BuGm5-ESp0jCaTnI9z2lPH-trDy94bzQ&usqp=CAU'),
                          ),
                          Positioned(
                              right: 5,
                              child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.black87.withOpacity(0.7),
                                      shape: BoxShape.circle
                                  ),
                                  child: Center(child: Icon(Icons.camera_alt,color: Colors.white,size:14,))
                              )
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 15,),
                          Row(
                            children: <Widget>[
                              Text('홍정민짱11',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                              SizedBox(width:3,),
                              Text(Session.loginProvider)
                            ],
                          ),
                          SizedBox(height: 8,),
                          GestureDetector(
                            onTap: (){
                              if(Session.type != 'sa' && Session.type != 'sil'){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SelectSaOrSilScreen()),
                                );
                              }
                            },
                            child: Text(Session.type != 'sa' && Session.type != 'sil' ?
                            '관리사 / 관리실 등록하기' :
                            Session.type=='sa' ? '관리사' :
                            Session.type=='sil' ? '관리실' : '관리사/관리실 등록하기' ,
                              style: TextStyle(
                                  color: kAppMainColor,
                                  fontSize:Session.type==null ? 14 : 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height:25,),
                  //todo 새로운 요청 등록하기(관리사 인지 관리실 인지에 따라서 버튼 구성)
                  Visibility(
                    visible: Session.type != 'sa' && Session.type != 'sil' ? false : true,
                    child: Material( // needed
                      borderRadius: BorderRadius.circular(12),
                      color: kAppMainColor,
                      child: InkWell(
                        splashColor: kAppMainSplashColor,
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          if(Session.type=='sa'){
                            //todo 관리사의 요청 등록

                          }else if(Session.type=='sil'){
                            //todo 관리실의 요청 등록

                          }else{
                            //todo 아무것도 아닌 경우

                          }
                        }, // needed
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical:10,horizontal: 30),
                          child: Container(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.add,size: 18,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text(
                                    '새로운 요청 등록하기',
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8,),
            //todo 공지사항,승인/요청 내역,결제내역, 환결설정, 현재버전 카드 형식 셀렉트
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal:10,vertical:0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  HorizontalNav(
                    text: '공지사항',
                    onTap: (){},
                  ),
                  HorizontalNav(
                    text: '승인/요청 내역',
                    onTap: (){},
                  ),
                  HorizontalNav(
                    text: '결제 내역',
                    onTap: (){},
                  ),
                  HorizontalNav(
                    text: '환경설정',
                    onTap: (){},
                  ),
                ],
              ),
            )


            //todo 결제(정기권) 구성
          ],
        ),
      ),
    );
  }
}

class HorizontalNav extends StatelessWidget {
  final String text;
  final Function onTap;
  HorizontalNav({this.onTap,this.text});


  final _color=Color(0xff332b2d);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text,style:TextStyle(color: _color,fontWeight: FontWeight.bold,fontSize: 17),),
          Icon(Icons.keyboard_arrow_right,color:_color,size: 26,)
        ],
      ),
    );
  }
}


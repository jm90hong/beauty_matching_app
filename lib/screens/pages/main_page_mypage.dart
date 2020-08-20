import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
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
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'MY 페이지',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius:40,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ5T9BuGm5-ESp0jCaTnI9z2lPH-trDy94bzQ&usqp=CAU'),
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
                    Text(Session.type==null ?
                    '관리사 / 관리실 등록하기' :
                    Session.type=='sa' ? '관리사' :
                    Session.type=='sil' ? '관리실' : '관리사/관리실 등록하기' ,
                      style: TextStyle(
                          color: kAppMainColor,
                          fontSize:Session.type==null ? 13 : 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),

            SizedBox(height:25,),
            //todo 요청 올리기(관리사 인지 관리실인지에 따라서 버튼 구성)

            //todo 공지사항,승인/요청 내역,결제내역, 환결설정, 현재버전 카드 형식 셀렉트

            //todo 결제(정기권) 구성
          ],
        ),
      ),
    );
  }
}

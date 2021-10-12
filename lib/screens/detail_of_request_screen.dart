import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'detail_of_sil_screen.dart';

class DetailOfRequestScreen extends StatefulWidget {
  final String shopName;
  final String shopImageUrl;
  final String bedOrWork;


  DetailOfRequestScreen({
    @required this.shopName,
    @required this.shopImageUrl,
    @required this.bedOrWork
  });

  @override
  _DetailOfRequestScreenState createState() => _DetailOfRequestScreenState();
}

class _DetailOfRequestScreenState extends State<DetailOfRequestScreen> {


  //todo STYLES
  TextStyle _bigTS = TextStyle(color: Colors.black,
      fontSize:24,fontWeight: FontWeight.bold,fontFamily: 'ns');

  TextStyle _infoTitleTS = TextStyle(color:Colors.grey,fontWeight: FontWeight.bold,fontSize:14);
  TextStyle _infoContentTS = TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize:14);

  Widget _buildInfoBox({String title, String content}){
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width:90,
              child: Text(title,style: _infoTitleTS,)
          ),
          SizedBox(width:20,),
          Flexible(child: Text(content,style: _infoContentTS))
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: '${widget.shopName}의 요청',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   SizedBox(height: 30,),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Container(
                         width: 90,
                         height: 90,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: NetworkImage(widget.shopImageUrl)
                             ),
                             borderRadius: BorderRadius.all(Radius.circular(8.0))
                         ),
                       ),
                       SizedBox(width: 20,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           SizedBox(height:6,),
                           Text(widget.shopName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                           SizedBox(height:10,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               GestureDetector(
                                 onTap: (){

                                 },
                                 child: Row(
                                   children: <Widget>[
                                     Icon(Icons.phone,size:16,color:Color(0xff444444),),
                                     SizedBox(width:8,),
                                     Text('전화',style:TextStyle(color: Color(0xff444444),fontSize:14,fontWeight: FontWeight.w600),),
                                   ],
                                 ),
                               ),
                               SizedBox(width:10,),
                               Container(height:10, child: VerticalDivider(color: Colors.grey.shade300,thickness: 1,)),
                               SizedBox(width:10,),
                               Row(
                                 children: <Widget>[
                                   Icon(FontAwesomeIcons.solidHeart,size: 16,color: kAppMainColor,),
                                   SizedBox(width:8,),
                                   Text('찜 54',style: TextStyle(color: Color(0xff444444),fontSize:14,fontWeight: FontWeight.w600),),
                                 ],
                               ),

                             ],
                           ),

                           RawMaterialButton(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(6)
                             ),
                             splashColor: kAppMainSplashColor,
                             fillColor: kAppMainColor,
                             constraints: BoxConstraints(),
                             padding: EdgeInsets.symmetric(vertical:5,horizontal: 10), // optional, in order to add additional space around text if needed
                             child: Text('상세정보 보기',style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                             onPressed:(){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => DetailOfSilScreen(
                                   heroTag: 'sil_1',
                                   shopName: '좋은 피부관리실',
                                   isShowingRequest: false,
                                 )),
                               );
                             },
                           ),
                         ],
                       )
                     ],
                   ),
                   SizedBox(height: 18,),
                   Text('요청내용',style: TextStyle(color: kAppMainColor,fontSize:13,fontWeight: FontWeight.bold),),
                   _buildInfoBox(
                       title: '주소',
                       content: '부산광역시 북구 부산 연제구 부산시청 1001 1층'
                   ),
                   _buildInfoBox(
                       title: '요청 타입',
                       content: widget.bedOrWork=='bed' ? '베드 할당' : '구인'
                   ),
                   _buildInfoBox(
                       title: '모집인원',
                       content: '1 명'
                   ),
                   _buildInfoBox(
                       title: '근무타입',
                       content: '당일'
                   ),
                   _buildInfoBox(
                       title: '근무날짜',
                       content: '2020-08-18 화'
                   ),
                   _buildInfoBox(
                       title: '근무시간(평균)',
                       content: '17:00 ~ 20:00'
                   ),
                   _buildInfoBox(
                       title: '담당자 연락처',
                       content: '01099361422'
                   ),
                   _buildInfoBox(
                       title: '급여',
                       content: '8,590 원'
                   ),
                   _buildInfoBox(
                       title: '요청사항',
                       content: '타월 1개 필수로 지참해서 오시면 되고요. 나머지는 따로 교육 해드립니다^^'
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 20),
                     child: Container(
                       width: double.infinity,
                       height: 0.5,
                       color: Colors.grey.shade300,
                     ),
                   ),
                   Text('요청하기 전에!',style: TextStyle(color: kAppMainColor,fontSize:13,fontWeight: FontWeight.bold),),
                   SizedBox(height: 10,),
                   Text('1. 베드 할당 요청 후 관리실의 승인이 있어야 매치가 성사됩니다.',style: TextStyle(color: Colors.black87,fontSize:11,fontWeight: FontWeight.normal),),
                   SizedBox(height: 5,),
                   Text("2. 승인 여부는 앱 메인에서 [요청/승인] 탭에서 확인 할 수 있습니다.",style: TextStyle(color: Colors.black87,fontSize:11,fontWeight: FontWeight.normal),),


                 ],
               ), 
              ),
            ),
            BottomButton(onTap: (){}, btnText: '베드할당 요청하기')
          ],
        ),
      ),
    );
  }
}

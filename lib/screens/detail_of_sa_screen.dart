import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:beautymatchingapp/constant/my_dialog.dart';
import 'package:beautymatchingapp/screens/write_request_screen.dart';
import 'package:beautymatchingapp/ui/card/reply_card.dart';
import 'package:flutter/material.dart';


class DetailOfSaScreen extends StatefulWidget {
  final int saIdx;
  final String nickname;
  final String profileImageUrl;
  final String introMsg;
  DetailOfSaScreen({
    @required this.saIdx,
    @required this.nickname,
    @required this.profileImageUrl,
    @required this.introMsg,
  });


  @override
  _DetailOfSaScreenState createState() => _DetailOfSaScreenState();
}

class _DetailOfSaScreenState extends State<DetailOfSaScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title:widget.nickname,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star_border,size:30,color:kAppMainColor,),
              onPressed: (){

              },
            )
          ],
      ),
      body: Container(
        padding: EdgeInsets.only(top:0,left:8,right:8,bottom:0),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom:20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius:42,
                            backgroundImage: NetworkImage(widget.profileImageUrl),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left:30,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(widget.nickname,
                                    style: AppTextStyles.cardTextStyle.title.copyWith(
                                        fontSize:15,
                                    ),
                                  ),
                                  SizedBox(height:6,),
                                  Row(
                                    children: <Widget>[
                                      //rate
                                      Icon(Icons.star,color: kAppMainColor,size:14,),
                                      SizedBox(width:4),
                                      Text('4.3',style:AppTextStyles.cardTextStyle.star,),
                                      SizedBox(width:13),
                                      Text('부산',style:AppTextStyles.cardTextStyle.location,)
                                      //city
                                    ],
                                  ),
                                  SizedBox(height:4,),
                                  Text('경략 마사지 2년 / 피부관리 3년',style: AppTextStyles.cardTextStyle.smallGrey,)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height:40,),
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyInfoTitle(title: '관리사님 소개',),
                            SizedBox(height:15,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.8,
                              child:  Text('때로는 다정한 친구로 행복한 연인으로 \n'
                                  '사각의 사이버 공간에서 우리가 닉네임으로'
                                  '사각의 사이버 공간에서 우리가 닉네임으로'
                                  '사각의 사이버 공간에서 우리가 닉네임으로'
                                  '사각의 사이버 공간에서 우리가 닉네임으로'
                                  '사각의 사이버 공간에서 우리가 닉네임으로'
                                  '사각의 사이버 공간에서 우리가 닉네임으로'
                                  '사각의 사이버 공간에서 우리가 닉네임으로'
                                  '사각의 사이버 공간에서 우리가 닉네임으로'
                                  '사각의 사이버 공간에서 우리가 닉네임으로'
                                  '사각의 사이버 공간에서 우리가 닉네임으로',
                                style:AppTextStyles.globalTextStyle.content,
                                textAlign:TextAlign.start,
                              ),
                            ),
                            SizedBox(height:25,),
                            MyInfoTitle(title: '관련 자격/증명',),
                            SizedBox(height:15,),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                 _buildCertificateImage(
                                   size:100,
                                   imageUrl: 'https://image.chosun.com/sitedata/image/201705/13/2017051300334_0.jpg'
                                 ),
                                 _buildCertificateImage(
                                   size:100,
                                   imageUrl: 'https://image.chosun.com/sitedata/image/201705/13/2017051300334_0.jpg'
                                 ),
                                ],
                              ),
                            ),
                            SizedBox(height:25,),
                            MyInfoTitle(title: '후기',),
                            SizedBox(height:10,),
                            Container(
                              padding: EdgeInsets.only(bottom:15),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width:0.5,
                                    color: Color(0xffeeeeee)
                                  )
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.star,color: kAppMainColor,size:32,),
                                      SizedBox(width:4,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: <Widget>[
                                          Text('4.3',style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize:26
                                          ),
                                          ),
                                          SizedBox(width:3,),
                                          Text('/ 5',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize:18
                                          ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),

                                  Text('전체 후기',style: TextStyle(color:Color(0xff2245D3),fontWeight: FontWeight.bold,fontSize:14),)
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                //todo 후기글 리스트(관리실에서 작성한 후기)
                                ReplyCard(
                                  shopName: '부산 하이얀 피부관리',
                                  rating:4,
                                  reply: '이분 진짜 잘하시는 분입니다^^',
                                ),
                                ReplyCard(
                                  shopName: '부산 하이얀 피부관리',
                                  rating:2,
                                  reply: '이분 진짜 잘하시는 분입니다^^',
                                ),
                                ReplyCard(
                                  shopName: '부산 하이얀 피부관리',
                                  rating:5,
                                  reply: '이분 진짜 잘하시는 분입니다^^',
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible:true,
              child: BottomButton(
                btnText: '관리사 요청하기',
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WriteRequestScreen(
                      saNickname: widget.nickname,
                      requestType: 'd',
                    )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


Widget _buildCertificateImage({double size,String imageUrl}){
  return Container(
    width: size,
    height:size,
    margin: EdgeInsets.only(right:15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      image: DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover
      )
    ),
  );
}


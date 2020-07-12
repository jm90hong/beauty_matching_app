import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SaCardType2 extends StatefulWidget {

  final profileImageUrl;
  final nickname;
  final location;
  final distance;
  final rate;
  final introMsg;
  final Function onTap;

  //Constructor
  SaCardType2({this.distance,this.location,this.nickname,
    this.profileImageUrl,this.introMsg,this.rate,this.onTap});

  @override
  _SaLongCardState createState() => _SaLongCardState();
}

class _SaLongCardState extends State<SaCardType2> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.onTap !=null){
          widget.onTap();
        }
      },
      child: Container(
        padding: EdgeInsets.only(top:17),
        width:double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width:140,
              height:140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.profileImageUrl)
                ),
                borderRadius: BorderRadius.all(Radius.circular(24.0))
              ),
            ),
            SizedBox(height:6,),
            Container(
              padding: EdgeInsets.only(left:4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('홍정민 짱',style:AppTextStyles.cardTextStyle.title,),
                  SizedBox(height:2),
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
                  SizedBox(height:4),
                  Text('경락 마사지 2년',style: AppTextStyles.cardTextStyle.smallGrey,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class SaLongListTile extends StatefulWidget {
  final profileImageUrl;
  final nickname;
  final location;
  final distance;
  final rate;
  final introMsg;
  final Function onTap;

  //Constructor
  SaLongListTile({this.distance,this.location,this.nickname,
    this.profileImageUrl,this.introMsg,this.rate,this.onTap});


  @override
  _SaLongListTileState createState() => _SaLongListTileState();
}

class _SaLongListTileState extends State<SaLongListTile> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical:7),
      child: GestureDetector(
        onTap:(){
        if(widget.onTap !=null){
          widget.onTap();
        }
      },
        child: Container(
          width:double.infinity,
          height:75,
          child: Row(
            children: <Widget>[
              Container(
                width:70,
                height:75,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.profileImageUrl)
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left:10,top:6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('홍정민 짱',style: AppTextStyles.cardTextStyle.title,),
                      SizedBox(height:3,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star,color: kAppMainColor,size:14,),
                          SizedBox(width:4),
                          Text('4.3',style:AppTextStyles.cardTextStyle.star,),
                          SizedBox(width:13),
                          Text('부산',style: AppTextStyles.cardTextStyle.location,),
                        ],
                      ),
                      SizedBox(height:4),
                      Text('경락 마사지 2년, 피부 마사지 가능',style: AppTextStyles.cardTextStyle.smallGrey,),
                      SizedBox(height:4),
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.arrowsAltH,size:11,color: Colors.grey,),
                          SizedBox(width:6,),
                          Text('12km',style:TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize:12),)
                        ],
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

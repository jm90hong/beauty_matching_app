import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class SilLongListTile extends StatefulWidget {
  final shopImageUrl;
  final shopName;
  final location;
  final distance;
  final numberOfSa;
  final Function onTap;

  //Constructor
  SilLongListTile({this.distance,this.location,this.shopName,
    this.shopImageUrl,this.numberOfSa,this.onTap});


  @override
  _SilLongListTileState createState() => _SilLongListTileState();
}

class _SilLongListTileState extends State<SilLongListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical:7),
      child: GestureDetector(
        onTap: (){
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
                        image: NetworkImage(widget.shopImageUrl)
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
                      Text('하이얀 피부관리샵',style: AppTextStyles.cardTextStyle.title,),
                      SizedBox(height:3,),
                      Row(
                        children: <Widget>[
                          NumberOfSaTag(number:0,),
                          SizedBox(width:10,),
                          Text('부산',style: AppTextStyles.cardTextStyle.location,),
                        ],
                      ),
                      SizedBox(height:4),
                      Text('경락 마사지, 피부 마사지',style: AppTextStyles.cardTextStyle.smallGrey,),
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

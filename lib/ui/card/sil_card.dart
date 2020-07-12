import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/material.dart';


class SilCard extends StatefulWidget {
  final shopImageUrl;
  final shopName;
  final location;
  final distance;
  final numberOfSa;
  SilCard({this.shopImageUrl,this.distance,this.location,this.shopName,this.numberOfSa});
  @override
  _SilCardState createState() => _SilCardState();
}

class _SilCardState extends State<SilCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width:150,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width:130,
                height:130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.shopImageUrl)
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                ),
              ),
            ],
          ),
          SizedBox(height:5,),
          Text(widget.shopName, style:AppTextStyles.cardTextStyle.title,overflow: TextOverflow.clip,),
          SizedBox(height:2,),
          //Text('${widget.numberOfSa} 명 모집',style:_numberTextStyle,),
          NumberOfSaTag(number:widget.numberOfSa),
          SizedBox(height:4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(widget.location, style:AppTextStyles.cardTextStyle.location,),
              SizedBox(width:20,),
              Text(widget.distance,style: AppTextStyles.cardTextStyle.distance,)
            ],
          )
        ],
      ),
    );
  }
}


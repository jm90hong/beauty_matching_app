import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:flutter/material.dart';


class SilCard extends StatefulWidget {
  final shopImageUrl;
  final shopname;
  final location;
  final distance;
  final numberOfSa;
  SilCard({this.shopImageUrl,this.distance,this.location,this.shopname,this.numberOfSa});
  @override
  _SilCardState createState() => _SilCardState();
}

class _SilCardState extends State<SilCard> {
  TextStyle _titleTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 13
  );
  TextStyle _numberTextStyle = TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.normal,
      fontSize:12
  );

  TextStyle _locationTextStyle = TextStyle(
      color: kAppMainColor,
      fontWeight: FontWeight.normal,
      fontSize: 12
  );

  TextStyle _distanceTextStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize: 12
  );

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
              Image.network(
                widget.shopImageUrl,
                fit: BoxFit.cover,
                width:130,
                height:130,
              ),
            ],
          ),
          SizedBox(height:5,),
          Text(widget.shopname, style:_titleTextStyle,overflow: TextOverflow.clip,),
          SizedBox(height:2,),
          Text('${widget.numberOfSa} 명 모집',style:_numberTextStyle,),
          SizedBox(height:4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(widget.location, style:_locationTextStyle,),
              SizedBox(width:20,),
              Text(widget.distance,style: _distanceTextStyle,)
            ],
          )
        ],
      ),
    );
  }
}

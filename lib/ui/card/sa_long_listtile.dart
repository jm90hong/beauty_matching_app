import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:flutter/material.dart';



class SaLongListTile extends StatefulWidget {
  final profileImageUrl;
  final nickname;
  final location;
  final distance;
  final rate;
  final introMsg;


  //Constructor
  SaLongListTile({this.distance,this.location,this.nickname,
    this.profileImageUrl,this.introMsg,this.rate});


  @override
  _SaLongListTileState createState() => _SaLongListTileState();
}

class _SaLongListTileState extends State<SaLongListTile> {

  TextStyle _titleTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14
  );

  TextStyle _locationTextStyle = TextStyle(
      color: kAppMainColor,
      fontWeight: FontWeight.normal,
      fontSize: 12
  );

  TextStyle _startTextStyle = TextStyle(
      color:Colors.black54,
      fontWeight: FontWeight.bold,
      fontSize: 12
  );

  TextStyle _greyTextStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 11
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            width:70,
            height:70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.profileImageUrl)
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
          ),
          Column(
            children: <Widget>[
              Text('홍정민 짱')
            ],
          )
        ],
      ),
    );
  }
}

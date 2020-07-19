import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ReplyCard extends StatefulWidget {
  final String shopName;
  final int rating;
  final String reply;


  ReplyCard({this.rating,this.reply,this.shopName});

  @override
  _ReplyCardState createState() => _ReplyCardState();
}


class _ReplyCardState extends State<ReplyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(widget.shopName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:14),),
              SizedBox(width:5,),
              Row(
                children: _buildRatingStars(widget.rating),
              ),
            ],
          ),
          SizedBox(height:5,),
          Text(widget.reply,style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.normal,
            fontSize:13
          ),)
        ],
      ),
    );
  }
}


List<Widget> _buildRatingStars(int rating){
  var list=List<Widget>();
  int maxRating=5;
  double starSize=14;
  for(int i=0;i < rating;i++){
    Icon star = Icon(Icons.star,size:starSize,color: kAppMainColor,);
    list.add(star);
  }
  for(int i=0;i < maxRating-rating;i++){
    Icon star = Icon(Icons.star,size:starSize,color:Colors.grey,);
    list.add(star);
  }
  return list;
}
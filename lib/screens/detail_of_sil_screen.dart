import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:beautymatchingapp/main.dart';
import 'package:flutter/material.dart';


class DetailOfSilScreen extends StatefulWidget {
  final String shopName;
  DetailOfSilScreen({this.shopName});
  @override
  _DetailOfSilScreenState createState() => _DetailOfSilScreenState();
}

class _DetailOfSilScreenState extends State<DetailOfSilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.shopName,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border,size:30,color:kAppMainColor,),
            onPressed: (){

            },
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(top:0,left:8,right:8,bottom:0),

      ),
    );
  }
}

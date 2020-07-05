import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:flutter/material.dart';

class NumberOfSaTag extends StatelessWidget {

  final int number;
  NumberOfSaTag({this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:2,horizontal:7),
      decoration: BoxDecoration(
        color: kAppMainColor,
        borderRadius:BorderRadius.all(Radius.circular(5))
      ),
      child: Text(number.toString()+' 명 모집중',
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:10),),
    );
  }
}

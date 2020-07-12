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

class AppTextStyles {
  static TextStyle appBarTitleTextStyle=TextStyle(
      color:Colors.black,
      fontWeight: FontWeight.bold,
      fontSize:16
  );
  static CardTextStyle cardTextStyle = const CardTextStyle();

}

class CardTextStyle {
  const CardTextStyle();
  TextStyle get title =>
      TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 13);

  TextStyle get location =>
      TextStyle(
          color: kAppMainColor,
          fontWeight: FontWeight.normal,
          fontSize: 12);

  TextStyle get distance =>
      TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.normal,
          fontSize: 12);

  TextStyle get star =>
      TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 12);

  TextStyle get smallGrey =>
      TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 11);
}
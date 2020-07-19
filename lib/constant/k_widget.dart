import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class NumberOfSaTag extends StatelessWidget {

  final int number;
  NumberOfSaTag({this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:2,horizontal:7),
      decoration: BoxDecoration(
        color: number != 0 ? kAppMainColor : Colors.grey,
        borderRadius:BorderRadius.all(Radius.circular(5))
      ),
      child: Text(number != 0 ? number.toString()+' 명 모집중' : '모집 완료',
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
  static GlobalTextStyle globalTextStyle = const GlobalTextStyle();
}

class MyTitle extends StatelessWidget {
  final String title;
  MyTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.fiber_manual_record,color: kAppMainColor,size:7,),
        SizedBox(width:4,),
        Text(title,style:AppTextStyles.globalTextStyle.title,)
      ],
    );
  }
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


class GlobalTextStyle {
  const GlobalTextStyle();
  TextStyle get title =>
      TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 13);

  TextStyle get content =>
      TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.normal,
          fontSize: 14,
          height: 1.2
      );
}


class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;


  MyAppBar({this.title,this.preferredSize:const Size.fromHeight(50.0)});

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      title: Text(widget.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:17),),
      elevation: 0,
      backgroundColor: Colors.white,
      actions: <Widget>[
        Icon(Icons.star_border,size:30,color: kAppMainColor,)
      ],
    );
  }
}

class BottomButton extends StatefulWidget {
  final btnText;
  final onTap;

  BottomButton({@required this.onTap,@required this.btnText});


  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color:kAppMainColor,
      child: InkWell(
        onTap: (){
          if(widget.onTap!=null){
            widget.onTap();
          }
        },
        child: Container(
          width: double.infinity,
          height:45,
          alignment: Alignment.center,
          child: Text(widget.btnText,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:15),
          ),
        ),
      ),
    );
  }
}




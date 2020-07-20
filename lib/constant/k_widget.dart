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


class MyInfoTitle extends StatelessWidget {
  final String title;
  MyInfoTitle({@required this.title});

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


class MyFormTitle extends StatelessWidget {
  final String title;
  final bool isDone;

  MyFormTitle({@required this.title,@required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.check_circle,color: isDone? kAppMainColor : Colors.grey.shade300,size:20,),
        SizedBox(width:6,),
        Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize:13)),
      ],
    );
  }
}

class RectangleRadioBox extends StatelessWidget {
  final double width;
  final String text;
  final double height;
  final bool isSelected;
  final Function onTap;
  final double fontSize;
  RectangleRadioBox({
    this.text,
    this.width,
    this.height,
    this.isSelected,
    this.onTap,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap!=null){
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isSelected ? kAppMainColor : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
            color: isSelected ? kAppMainColor : Colors.grey.shade400
          )
        ),
        child: Center(
          child: Text(text,style: TextStyle(
              color:isSelected ? Colors.white : Colors.grey.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),
          ),
        ),
      ),
    );
  }
}


class FormSection extends StatelessWidget {
  final Widget child;
  FormSection({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.only(top: 10,left:8,right:8,bottom:20),
        color: Colors.white,
        width: double.infinity,
        child: child,
      ),
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
  final List<Widget> actions;

  MyAppBar({this.actions,this.title,this.preferredSize:const Size.fromHeight(50.0)});

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
      actions: widget.actions,
    );
  }
}



class TimeSelectButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function onTap;
  final double width;
  final double height;
  final double fontSize;

  TimeSelectButton({
    @required this.onTap,
    @required this.isSelected,
    @required this.text,
    @required this.height,
    @required this.width,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        onTap: (){
          onTap();
        },
        child: Container(
          width: width,
          height: height,
          child: Center(
            child: Text(text,style:TextStyle(
              color: isSelected ? Colors.black : Colors.black26,
              fontSize:fontSize!=null ? fontSize : 15,
              fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
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




import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        padding: EdgeInsets.only(top: 15,left:8,right:8,bottom:30),
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
      title: Text(
        widget.title,
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize:16
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      actions: widget.actions,
    );
  }
}



class OverlayingAppBar extends StatefulWidget {
  final String title;
  final bool isLike;
  final Color backgroundColor;
  final Color widgetColor;
  final Color titleColor;
  final Color likeColor;

  OverlayingAppBar({
    @required this.title,
    @required this.isLike,
    @required this.backgroundColor,
    @required this.likeColor,
    @required this.widgetColor,
    @required this.titleColor
  });

  @override
  _OverlayingAppBarState createState() => _OverlayingAppBarState();
}

class _OverlayingAppBarState extends State<OverlayingAppBar> {



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color:widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: widget.widgetColor,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              SizedBox(width:20,),
              Text(widget.title,style: TextStyle(color:widget.titleColor,fontWeight: FontWeight.bold,fontSize: 16),)
            ],
          ),

          IconButton(
            icon: Icon(FontAwesomeIcons.heart,color: widget.likeColor,size: 24,),
            onPressed: (){

            },
          )



        ],
      ),
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

class MyTextArea extends StatefulWidget {
  final Function onChanged;
  final TextEditingController textEditingController;
  final String hintText;
  MyTextArea({
    this.textEditingController,
    this.onChanged,
    this.hintText
  });


  @override
  _MyTextAreaState createState() => _MyTextAreaState();
}

class _MyTextAreaState extends State<MyTextArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        style: TextStyle(color: Colors.black,fontSize:13),
        cursorColor: Colors.black,
        controller: widget.textEditingController,
        minLines:3,
        maxLines: null,
        readOnly: false,
        onChanged: (value){
          widget.onChanged(value);
        },
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300,)
          ),
        ),
      ),
    );
  }
}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}



class SelectingTypeBox extends StatelessWidget {
  final String text;
  final String subText;
  final bool isSelected;
  final Function onTap;


  SelectingTypeBox({
    @required this.isSelected,
    @required this.text,
    this.subText,
    this.onTap
  });


  Widget _buildCircleBox({bool isSelected}){
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          color: isSelected ? kAppMainColor : Colors.grey.shade300,
          shape: BoxShape.circle
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          if(onTap!=null){
            onTap();
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildCircleBox(isSelected:isSelected),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(text,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight:FontWeight.bold),),
                  SizedBox(height: 8,),
                  Text(subText,style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
        )
    );
  }
}
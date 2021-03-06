import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:beautymatchingapp/screens/detail_of_sa_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SaCard extends StatefulWidget {
  final int saIdx;
  final profileImageUrl;
  final nickname;
  final location;
  final distance;
  final Function onTap;

  SaCard({this.saIdx,this.profileImageUrl,this.distance,this.location,this.nickname,this.onTap});

  @override
  _SaCardState createState() => _SaCardState();
}

class _SaCardState extends State<SaCard> {

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        if(widget.onTap==null){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                DetailOfSaScreen(
                  saIdx:widget.saIdx,
                  nickname:widget.nickname,
                  profileImageUrl: widget.profileImageUrl,
                )
            ),
          );
        }else{
          widget.onTap();
        }
      },
      child: Container(
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
                          image: NetworkImage(widget.profileImageUrl)
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                ),
              ],
            ),
            SizedBox(height:5,),
            Text(widget.nickname, style:AppTextStyles.cardTextStyle.title,overflow: TextOverflow.clip,),
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
      ),
    );
  }
}

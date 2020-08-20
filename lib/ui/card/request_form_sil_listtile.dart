import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class RequestFromSilListTile extends StatefulWidget {
  final int numberOfSa;
  final String shopImageUrl;
  final String shopName;
  final String city;
  final String workType;
  final String workDate;
  final String workTime;
  final double longitude;
  final double latitude;
  final Function onTap;
  final String bedOrWork;


  RequestFromSilListTile({
    @required this.shopImageUrl,
    @required this.shopName,
    @required this.city,
    @required this.workDate,
    @required this.workType,
    @required this.latitude,
    @required this.longitude,
    @required this.numberOfSa,
    @required this.bedOrWork,
    this.onTap,
    this.workTime,
  });

  @override
  _RequestFromSilListTileState createState() => _RequestFromSilListTileState();
}

class _RequestFromSilListTileState extends State<RequestFromSilListTile> {



  Widget _buildWorkTypeTag({String workType}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: workType=='day' ? Colors.deepOrangeAccent : Colors.blueAccent
      ),
      child: Text(
          workType=='day' ? '당일' : '기간',
          style: TextStyle(color: Colors.white,fontSize:11,fontWeight: FontWeight.bold),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:10),
      child: GestureDetector(
        onTap: (){
          if(widget.onTap!=null){
            widget.onTap();
          }
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 8,right: 8),
          width: MediaQuery.of(context).size.width,
          height:75,
          child: Row(
            children: <Widget>[
              Container(
                width: 75,
                height: 75,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.shopImageUrl)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.black.withOpacity(0.7)
                      ),
                      child: Center(
                        child: Text(
                          widget.bedOrWork == 'bed' ? '베드' : '구인',
                          style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left:10,top: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('[${widget.city}] ${widget.shopName}' ,style: AppTextStyles.cardTextStyle.title,),
                      SizedBox(height: 2,),
                      Text('부산광역시 연제구 부산 시청 1001 1층',style: TextStyle(
                          color: Colors.grey,
                          fontSize:10,
                          fontWeight: FontWeight.normal,
                      ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: <Widget>[
                          _buildWorkTypeTag(workType:widget.workType),
                          SizedBox(width: 3,),
                          Text(widget.workDate,style: TextStyle(
                              color: Colors.black,
                              fontWeight:FontWeight.normal,
                              fontSize:widget.workType=='day' ? 12 : 11
                          ),)
                        ],
                      ),
                      SizedBox(height:3),
                      Row(
                        children: <Widget>[
                          Text('${widget.numberOfSa}명 모집',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 11),),
                          SizedBox(width:12,),
                          Icon(FontAwesomeIcons.arrowsAltH,size:11,color: Colors.grey,),
                          SizedBox(width:6,),
                          Text('12km',style:TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize:12),)
                        ],
                      )


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

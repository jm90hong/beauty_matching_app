import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/material.dart';


class RequestFromSilListTile extends StatefulWidget {
  final String shopImageUrl;
  final String shopName;
  final String city;
  final String workType;
  final String workDate;
  final String workTime;

  RequestFromSilListTile({
    @required this.shopImageUrl,
    @required this.shopName,
    @required this.city,
    @required this.workDate,
    @required this.workType,
    this.workTime,
  });

  @override
  _RequestFromSilListTileState createState() => _RequestFromSilListTileState();
}

class _RequestFromSilListTileState extends State<RequestFromSilListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8,right: 8),
      width: MediaQuery.of(context).size.width,
      height:75,
      child: Row(
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
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left:10,top: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.shopName ,style: AppTextStyles.cardTextStyle.title,),
                  SizedBox(height: 3,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

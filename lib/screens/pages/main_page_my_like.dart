import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:beautymatchingapp/ui/card/sil_long_listtile.dart';
import 'package:flutter/material.dart';

//TODO my찜
class MainPageMyLike extends StatefulWidget {
  @override
  _MainPageMyLikeState createState() => _MainPageMyLikeState();
}

class _MainPageMyLikeState extends State<MainPageMyLike> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width:double.infinity,
              height:45,
              child:Text('my찜',style: AppTextStyles.appBarTitleTextStyle,)
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SilLongListTile(shopImageUrl: 'https://www.seoulwire.com/news/photo/201905/126989_243387_1333.jpg',)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

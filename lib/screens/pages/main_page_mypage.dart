import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/material.dart';



//TODO 마이페이지
class MainPageMyPage extends StatefulWidget {
  @override
  _MainPageMyPageState createState() => _MainPageMyPageState();
}


class _MainPageMyPageState extends State<MainPageMyPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'MY 페이지',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius:40,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ5T9BuGm5-ESp0jCaTnI9z2lPH-trDy94bzQ&usqp=CAU'),
                ),
                SizedBox(width: 20,),
                Column(
                  children: <Widget>[
                    SizedBox(height: 12,),
                    Text('홍정민짱11',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:beautymatchingapp/vo/session.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';




class MainPage1 extends StatefulWidget {
  @override
  _MainPage1State createState() => _MainPage1State();
}


class _MainPage1State extends State<MainPage1> {


  Future<Position> getCurrentUserLocation() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((location) {
      return location;
    });
  }


  @override
  void initState() async{
    // TODO: implement initState
    super.initState();
    Position location = await getCurrentUserLocation();

  }




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('page1 : ${Session.loginId}'),
    );
  }
}

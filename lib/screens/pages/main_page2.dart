import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


//TODO 내주변
class MainPage2 extends StatefulWidget {
  @override
  _MainPage2State createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var geolocator = Geolocator();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    geolocator.getPositionStream(locationOptions).listen((Position position) {
      //position 받아옴
      print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

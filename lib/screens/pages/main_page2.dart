import 'package:beautymatchingapp/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';


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
      //todo 현재 location 받아옴
      print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
      Provider.of<LocationModel>(context,listen: false).getAddress(
          latitude:position.latitude.toString(),
          longitude: position.longitude.toString()
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Consumer<LocationModel>(
            builder: (context,locationModel,child){
              return Text('${locationModel.address}');
            },
          ),
        ),
      ),
    );
  }
}

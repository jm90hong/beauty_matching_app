import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/models/location_model.dart';
import 'package:beautymatchingapp/ui/card/sa_long_listtile.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';


//TODO 내주변
class MainPage2 extends StatefulWidget {
  @override
  _MainPage2State createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {


  TextStyle _locationTextStyle = TextStyle(
    color:Colors.black,
    fontWeight: FontWeight.bold,
    fontSize:16
  );

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
          padding: EdgeInsets.symmetric(horizontal:8),
          color: Colors.white,
          child: Column(
            children: <Widget>[
                Consumer<LocationModel>(
                  builder: (context,locationModel,child){
                    return Container(
                      width:double.infinity,
                      height:45,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.location_on,size:19,color: kAppMainColor,),
                          SizedBox(width: 5,),
                          Text('${locationModel.address}',style: _locationTextStyle,)
                        ],
                      ),
                    );
                  },
                ),

              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SaLongListTile(profileImageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ5T9BuGm5-ESp0jCaTnI9z2lPH-trDy94bzQ&usqp=CAU',)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

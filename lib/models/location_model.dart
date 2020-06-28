import 'dart:convert';

import 'package:beautymatchingapp/constant/app_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LocationModel with ChangeNotifier{

  var client = http.Client();

  String address;

  Future<void> getAddress({String latitude, String longitude}) async {
    var requestUrl = AppConfig.geolocatorUrl;
    Uri uri = Uri.parse(requestUrl);
    var urlWithParam = uri.replace(queryParameters: {
      'lat':latitude,
      'lon':longitude
    });
    try{
      var response = await client.get(urlWithParam);
      address = utf8.decode(response.bodyBytes);
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

}










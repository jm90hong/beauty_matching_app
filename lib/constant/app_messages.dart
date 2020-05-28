import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppMessage {
  static final networkError='네트워크 오류 발생';

}

void showToast({@required String message}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 15.0
  );
}
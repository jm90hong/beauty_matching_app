import 'package:flutter/material.dart';

class MyDialog{
  static void showConfirmDialog({
    BuildContext context,
    String title,
    String content,
    Function onConfirm
  }) async{
    String result  = await showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text('확인'),
                onPressed: () {
                  onConfirm();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('취소'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }
}
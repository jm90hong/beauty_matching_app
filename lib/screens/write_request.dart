import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/material.dart';

class WriteRequest extends StatefulWidget {
  @override
  _WriteRequestState createState() => _WriteRequestState();
}

class _WriteRequestState extends State<WriteRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title:'관리사 요청하기'),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[

                      ],
                    ),
                  ),
                ),
              ),
              BottomButton(
                  onTap:(){

                  },
                  btnText:'요청하기')
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';



class SelectingTypeScreen extends StatefulWidget {
  @override
  _SelectingTypeScreenState createState() => _SelectingTypeScreenState();
}

class _SelectingTypeScreenState extends State<SelectingTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:Text('타입 선택'),
      ),
    );
  }
}

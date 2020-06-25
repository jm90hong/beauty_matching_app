import 'package:flutter/material.dart';


class SaCard extends StatefulWidget {
  @override
  _SaCardState createState() => _SaCardState();
}

class _SaCardState extends State<SaCard> {
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      height:100,
      color: Colors.red,
    );
  }
}

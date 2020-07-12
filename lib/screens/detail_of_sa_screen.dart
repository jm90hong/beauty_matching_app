import 'package:flutter/material.dart';


class DetailOfSaScreen extends StatefulWidget {
  final int saIdx;
  DetailOfSaScreen({@required this.saIdx});


  @override
  _DetailOfSaScreenState createState() => _DetailOfSaScreenState();
}

class _DetailOfSaScreenState extends State<DetailOfSaScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Text('detailOfSaScreen'),
      ),
    );
  }
}

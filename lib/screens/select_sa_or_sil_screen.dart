import 'package:flutter/material.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/painting.dart';

class SelectSaOrSilScreen extends StatefulWidget {
  @override
  _SelectSaOrSilScreenState createState() => _SelectSaOrSilScreenState();
}

class _SelectSaOrSilScreenState extends State<SelectSaOrSilScreen> {
  String _selectedType='sa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '관리사 요청 타입 선택',
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SelectingTypeBox(
                      isSelected: _selectedType=='sa'  ? true : false,
                      text: '관리사 등록',
                      subText: '일을 하고 싶어요',
                      onTap: (){
                        setState(() {
                          _selectedType='sa';
                        });
                      },
                    ),
                    SizedBox(height: 60,),
                    SelectingTypeBox(
                      isSelected: _selectedType=='sil'  ? true : false,
                      text: '관리실 등록',
                      subText: '좋은 관리사분들을 구하고 싶어요',
                      onTap: (){
                        setState(() {
                          _selectedType='sil';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical:15,horizontal:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    child: Text('다음',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18),),
                    onTap: (){

                    },
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

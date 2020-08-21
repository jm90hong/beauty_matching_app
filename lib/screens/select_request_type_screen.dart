import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:beautymatchingapp/screens/write_request_screen.dart';
import 'package:flutter/material.dart';

class SelectRequestTypeScreen extends StatefulWidget {
  final String nickname;
  final String requestType;

  SelectRequestTypeScreen({
    this.nickname,
    this.requestType
  });

  @override
  _SelectRequestTypeScreenState createState() => _SelectRequestTypeScreenState();
}


class _SelectRequestTypeScreenState extends State<SelectRequestTypeScreen> {
  String _selectedType='bed';


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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SelectingTypeBox(
                    isSelected: _selectedType=='bed'  ? true : false,
                    text: '베드 할당',
                    subText: '관리사에 베드를 할당하는 경우',
                    onTap: (){
                      setState(() {
                        _selectedType='bed';
                      });
                    },
                  ),
                  SizedBox(height: 60,),
                  SelectingTypeBox(
                    isSelected: _selectedType=='work'  ? true : false,
                    text: '구인 요청',
                    subText: '파트타임으로 요청 하는 경우',
                    onTap: (){
                      setState(() {
                        _selectedType='work';
                      });
                    },
                  ),
                ],
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WriteRequestScreen(
                            saNickname: widget.nickname,
                            requestType: widget.requestType,
                            bedOrWork: _selectedType,
                          )),
                        );
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



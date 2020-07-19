import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WriteRequest extends StatefulWidget {
  @override
  _WriteRequestState createState() => _WriteRequestState();
}

class _WriteRequestState extends State<WriteRequest> {
  String _workType='day'; //todo day, term
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title:'관리사 요청하기'),
      body: SafeArea(
        child: Container(
          color: kGreyPageBGColor,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height:20,),
                      FormSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //todo 근무 타입
                            MyFormTitle(title: '근무 타입',isDone:true,),
                            SizedBox(height:25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RectangleRadioBox(
                                  width:80,
                                  height:34,
                                  isSelected:_workType=='day' ? true : false,
                                  text: '당일',
                                  onTap: (){
                                    setState(() {
                                      _workType='day';
                                    });
                                  },
                                ),
                                SizedBox(
                                  width:40,
                                ),
                                RectangleRadioBox(
                                  width:80,
                                  height:34,
                                  isSelected:_workType=='term' ? true : false,
                                  text: '기간',
                                  onTap: (){
                                    setState(() {
                                      _workType='term';
                                    });
                                  },
                                ),
                              ],
                            ),
                            
                            //todo 근무시간
                            SizedBox(height:30,),
                            MyFormTitle(title: '근무 시간(평균)',isDone:false,),
                            SizedBox(height:4,),
                            Text('상세한 근무시간은 연락처를 통하여 상의해주세요.',
                              style:TextStyle(color: Colors.black54,fontSize:11),
                            ),

                          ],
                        ),
                      )
                    ],
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

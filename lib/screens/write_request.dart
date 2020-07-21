import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WriteRequest extends StatefulWidget {
  @override
  _WriteRequestState createState() => _WriteRequestState();
}

class _WriteRequestState extends State<WriteRequest> {
  String _workType='day'; //todo day, term
  String _startDate='empty';
  String _endDate='empty';

  double titleMargin=30;
  double contentMargin=25;


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
                            SizedBox(height:contentMargin,),
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
                                      _endDate='empty';
                                      _startDate='empty';
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
                                      _endDate='empty';
                                      _startDate='empty';
                                      _workType='term';
                                    });
                                  },
                                ),
                              ],
                            ),

                            //todo 근무 날짜
                            SizedBox(height: titleMargin,),
                            MyFormTitle(
                                title: '근무 날짜',
                                isDone: _workType=='day' && _startDate!='empty' ? true
                                    : _workType=='term' && _startDate!='empty' && _endDate!='empty' ? true :false
                            ),
                            SizedBox(height: contentMargin,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TimeSelectButton(
                                      isSelected:_startDate=='empty' ? false : true,
                                      text: _startDate=='empty' ? '시작 날짜' : _startDate,
                                      fontSize:15,
                                      width: 160,
                                      height: 36,
                                      onTap: () async{
                                        String result = await selectDate(context);
                                        setState((){
                                          _startDate=result;
                                        });
                                      },
                                    ),
                                    Visibility(
                                        visible: _workType=='term' ? true : false,
                                        child: SizedBox(width:8,)),
                                    Visibility(
                                      visible: _workType=='term' ? true : false,
                                      child: Text('부터',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:17),
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                    visible: _workType=='term' ? true : false,
                                    child: SizedBox(height:20,)),
                                Visibility(
                                  visible: _workType=='term' ? true : false,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TimeSelectButton(
                                        isSelected:_endDate=='empty' ? false : true,
                                        text: _endDate=='empty' ? '종료 날짜' : _endDate,
                                        fontSize: 15,
                                        width: 160,
                                        height: 36,
                                        onTap: () async{
                                          String result = await selectDate(context);
                                          setState((){
                                            _endDate=result;
                                          });
                                        },
                                      ),
                                      SizedBox(width:8,),
                                      Text('까지',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:17),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            
                            //todo 근무시간
                            SizedBox(height:titleMargin,),
                            MyFormTitle(title: '근무 시간 (평균)',isDone:false,),
                            SizedBox(height:4,),
                            Text('상세한 근무시간은 연락처를 통하여 상의해주세요.',
                              style:TextStyle(color: Colors.black54,fontSize:11),
                            ),
                            SizedBox(height:contentMargin,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                  TimeSelectButton(
                                    isSelected:false,
                                    text: '시작 시각',
                                    width: 95,
                                    height: 36,
                                    onTap: (){

                                    },
                                  ),
                                  SizedBox(width:5,),
                                  Text('부터',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:15),
                                  ),
                                  SizedBox(width:15,),
                                  TimeSelectButton(
                                    isSelected:false,
                                    text: '종료 시각',
                                    width: 95,
                                    height: 36,
                                    onTap: (){

                                    },
                                  ),
                                  SizedBox(width:5,),
                                  Text('까지',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:15),
                                  ),
                              ],
                            ),
                            SizedBox(height: titleMargin,),
                            MyFormTitle(title: '일일 급여',isDone:false,),
                            SizedBox(height:4,),
                            Text('상세한 급여 사항은 연락처를 통하여 상의해주세요.',
                              style:TextStyle(color: Colors.black54,fontSize:11),
                            ),
                            SizedBox(height: contentMargin,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width:105,
                                  child: TextField(
                                      cursorColor:Colors.black,
                                      keyboardType:TextInputType.number,
                                      inputFormatters:[WhitelistingTextInputFormatter.digitsOnly],
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: 4,bottom:10),
                                        hintText: '8,590',
                                        hintStyle: TextStyle(color: Colors.grey.shade400),
                                        isDense: true,
                                    ),
                                    style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(width:4,),
                                Text('원',style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:16),
                                ),
                                SizedBox(width:20,),
                                Row(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.check_box,color: kAppMainColor,),
                                        SizedBox(width: 3,),
                                        Text('시간',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14
                                        ),)
                                      ],
                                    ),
                                    SizedBox(width:10,),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.check_box,color: Colors.grey.shade300,),
                                        SizedBox(width: 3,),
                                        Text('일일',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14
                                        ),)
                                      ],
                                    )

                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: titleMargin,),
                            MyFormTitle(title: '연락처',isDone:false,),
                            SizedBox(height: contentMargin,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.check_box,color: Colors.grey.shade300,),
                                SizedBox(width: 3,),
                                Text('회원정보와 동일한 연락처 사용',style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),),
                              ],
                            ),
                            SizedBox(height:20,),
                            Container(
                              width: 200,
                              child: TextField(
                                cursorColor:Colors.black,
                                keyboardType:TextInputType.number,
                                inputFormatters:[WhitelistingTextInputFormatter.digitsOnly],
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 4,bottom:10),
                                  hintText: '010xxxxyyyy',
                                  hintStyle: TextStyle(color: Colors.grey.shade400),
                                  isDense: true,
                                ),
                                style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),
                              ),
                            )
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


Future<String> selectDate(BuildContext context,{helpText}) async {
  DateTime picked = await showDatePicker(
    helpText: helpText,
    context: context,
    locale: const Locale('ko', 'KO'),
    initialDate: DateTime.now(),
    firstDate: DateTime(2015),
    lastDate: DateTime(2090),
    builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData(primarySwatch: kAppMainColor, splashColor:kAppMainColor),
        child: child,
      );
    },
  );
  if(picked != null) {
    var weekday = picked.weekday;
    String weekdayKor;
    switch (weekday){
      case 1:weekdayKor='월';break;
      case 2:weekdayKor='화';break;
      case 3:weekdayKor='수';break;
      case 4:weekdayKor='목';break;
      case 5:weekdayKor='금';break;
      case 6:weekdayKor='토';break;
      case 7:weekdayKor='일';break;
    }
//    _playDateController.text='${picked.toString().substring(0, 10 )} $weekdayKor요일';
//    validPlayDate=true;
//    playDate='${picked.toString().substring(0, 10 )} $weekdayKor';


    return '${picked.toString().substring(0, 10 )} $weekdayKor요일';
  } else {
    return 'empty';
  }
}

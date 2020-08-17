import 'dart:math';

import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:beautymatchingapp/constant/k_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class WriteRequestScreen extends StatefulWidget {

  final String saNickname;
  final String requestType; //todo d, a

  WriteRequestScreen({
    @required this.saNickname,
    @required this.requestType
  });

  @override
  _WriteRequestScreenState createState() => _WriteRequestScreenState();
}

class _WriteRequestScreenState extends State<WriteRequestScreen> {
  int _numberOfSa=1;
  String _workType='day'; //todo day, term
  String _startDate='empty';
  String _endDate='empty';
  String _startTime='empty';
  String _endTime='empty';
  String _wageType='hour';
  String _bedName='empty';
  String _memo;
  int _wage=0;


  bool _doIuseTelOfMyInfo=false;

  double titleMargin=28;
  double contentMargin=18;
  final TextEditingController _wageTxtController = TextEditingController();
  final TextEditingController _telTxtController = TextEditingController();
  final TextEditingController _memoTxtController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _memoTxtController.dispose();
    _telTxtController.dispose();
    _wageTxtController.dispose();
    super.dispose();
  }

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

                            Visibility(
                              visible: widget.requestType=='d' ? true : false,
                              child: Text(
                                '${widget.saNickname} 님에게 요청',
                                style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 14),
                              ),
                            ),
                            SizedBox(height: 20,),
                            //todo 필수 입력...
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                              decoration: BoxDecoration(
                                color: kAppMainColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Text('필수 입력',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                            ),

                            Visibility(
                              visible: widget.requestType=='a' ? true : false,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 15,),
                                  MyFormTitle(title: '필요 인원',isDone:true,),
                                  SizedBox(height:contentMargin,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RawMaterialButton(
                                        splashColor: kAppMainSplashColor,
                                        onPressed: () {
                                          setState(() {
                                            if(_numberOfSa>1){
                                              setState(() {
                                                _numberOfSa--;
                                              });
                                            }
                                          });
                                        },
                                        child:Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                        shape:CircleBorder(),
                                        elevation: 1.0,
                                        fillColor: kAppMainColor,
                                        padding:EdgeInsets.all(10.0),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: <Widget>[
                                          Text(_numberOfSa.toString(),style:TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize:20
                                          ),),
                                          SizedBox(width:3,),
                                          Text('명',style:TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize:20
                                          ),)
                                        ],
                                      ),
                                      RawMaterialButton(
                                        splashColor: kAppMainSplashColor,
                                        onPressed: () {
                                          setState(() {
                                            _numberOfSa++;
                                          });
                                        },
                                        child:Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                        shape:CircleBorder(),
                                        elevation: 1.0,
                                        fillColor: kAppMainColor,
                                        padding:EdgeInsets.all(10.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),


                            SizedBox(height: 15,),
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
                                    FocusScope.of(context).unfocus();
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
                                    FocusScope.of(context).unfocus();
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
                                        FocusScope.of(context).unfocus();
                                        String result = await selectDate(context);
                                        if(result=='empty' && _startDate!='empty'){
                                          result=_startDate;
                                        }
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
                                    child: SizedBox(height:20,)
                                ),
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
                                          FocusScope.of(context).unfocus();
                                          String result = await selectDate(context);
                                          if(result=='empty' && _endDate!='empty'){
                                            result=_endDate;
                                          }
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
                            SizedBox(height: titleMargin,),
                            MyFormTitle(title: '베드 선택',
                              isDone:_bedName=='empty' ? false : true,),
                            SizedBox(height: contentMargin,),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  BedDropDownWidget(
                                    listOfBedName: ['베드 1','베드 2','베드 3','베드 4','베드 5','베드 6','베드 7',],
                                    onChanged: (newValue){
                                      setState(() {
                                        _bedName=newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: titleMargin,),
                            MyFormTitle(title: '연락처',isDone:false,),
                            SizedBox(height: contentMargin,),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _doIuseTelOfMyInfo = !_doIuseTelOfMyInfo;
                                });
                              },
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.check_box,
                                      color: _doIuseTelOfMyInfo ? kAppMainColor : Colors.grey.shade300,
                                    ),
                                    SizedBox(width: 3,),
                                    Text('회원정보와 동일한 연락처 사용',style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),),
                                  ],
                                ),
                              ),
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
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                ),
                                style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      FormSection(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                                decoration: BoxDecoration(
                                    color: kAppMainColor,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Text('선택 입력',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(height: 15,),
                              //todo 요청 사항
                              MyFormTitle(title: '요청 사항',
                                isDone:_memo==null || _memo=='' ? false : true,
                              ),
                              SizedBox(height: contentMargin,),
                              MyTextArea(
                                textEditingController: _memoTxtController,
                                hintText: 'ex) 제품 준비 및 요청사항',
                                onChanged: (value){
                                  setState(() {
                                    _memo=value;
                                  });
                                },
                              ),
                              SizedBox(height: titleMargin,),

                              //todo 근무시간
                              MyFormTitle(title: '근무 시간 (평균)',
                                isDone:_startTime!='empty' && _endTime!='empty' ? true : false,
                              ),
                              SizedBox(height:4,),
                              Text('상세한 근무시간은 연락처를 통하여 상의해주세요.',
                                style:TextStyle(color: Colors.black54,fontSize:11),
                              ),
                              SizedBox(height:contentMargin,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TimeSelectButton(
                                    isSelected:_startTime!='empty' ? true : false,
                                    text: _startTime!='empty' ? _startTime : '시작 시각',
                                    width: 95,
                                    height: 36,
                                    onTap: () async{
                                      FocusScope.of(context).unfocus();
                                      String result = await selectTime(context);
                                      setState(() {
                                        _startTime=result;
                                      });

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
                                    isSelected:_endTime!='empty' ? true : false,
                                    text: _endTime!='empty' ? _endTime : '종료 시각',
                                    width: 95,
                                    height: 36,
                                    onTap: () async{
                                      FocusScope.of(context).unfocus();
                                      String result = await selectTime(context);
                                      setState(() {
                                        _endTime=result;
                                      });
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
                              MyFormTitle(title: '일일 급여',
                                isDone:_wage>=1000 ? true : false,
                              ),
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
                                      controller: _wageTxtController,
                                      onChanged: (text){
                                        setState(() {
                                          _wage=int.parse(text);
                                        });
                                      },
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
                                      fontSize:16
                                  ),
                                  ),
                                  SizedBox(width:20,),
                                  Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _wageType='hour';
                                          });
                                        },
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.check_box,
                                                color:_wageType=='hour' ? kAppMainColor : Colors.grey.shade300,
                                              ),
                                              SizedBox(width: 3,),
                                              Text('시간',style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14
                                              ),)
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width:10,),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _wageType='day';
                                          });
                                        },
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.check_box,
                                                color: _wageType=='day' ? kAppMainColor : Colors.grey.shade300,
                                              ),
                                              SizedBox(width: 3,),
                                              Text('일일',style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14
                                              ),)
                                            ],
                                          ),
                                        ),
                                      )

                                    ],
                                  )
                                ],
                              ),
                            ],
                      ))
                    ],
                  ),
                ),
              ),
              BottomButton(
                  onTap:(){

                  },
                  btnText:'요청하기'
              )
            ],
          ),
        ),
      ),
    );
  }
}




Future<String> selectDate(BuildContext context,{String helpText}) async {
  DateTime picked = await showDatePicker(
    helpText: helpText,
    context: context,
    locale: const Locale('ko', 'KO'),
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
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
    return '${picked.toString().substring(0, 10 )} $weekdayKor요일';
  } else {
    return 'empty';
  }
}


Future<String> selectTime(BuildContext context) async{
  int hour=12;
  TimeOfDay picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour:hour, minute:0),
    builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData(primarySwatch: kAppMainColor, splashColor:kAppMainColor,),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        ),
      );
    },
  );

  if(picked !=null){
    String minStr;
    String hrStr;
    String pmOram;
    if(picked.hour<11 && picked.hour>=0){
      pmOram='오전';
    }else{
      pmOram='오후';
    }

    if(picked.hour<10){
      hrStr='0${picked.hour.toString()}';
    }else{
      hrStr=picked.hour.toString();
    }
    if(picked.minute<10){
      minStr='0${picked.minute.toString()}';
    }else{
      minStr=picked.minute.toString();
    }

    return pmOram+' '+hrStr+':'+minStr;
  }else{
    return 'empty';
  }
}


class BedDropDownWidget extends StatefulWidget {
  final Function onChanged;
  final List<String> listOfBedName;
  BedDropDownWidget({
    @required this.onChanged,
    @required this.listOfBedName
  });


  @override
  _BedDropDownWidgetState createState() => _BedDropDownWidgetState();
}

class _BedDropDownWidgetState extends State<BedDropDownWidget> {
  List<String> list = ['empty'];
  String selectedValue='empty';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.addAll(widget.listOfBedName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1
        )
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 20,
        elevation: 16,
        isDense: true,
        iconEnabledColor: Colors.black54,
        style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize:15),
        underline: Container(
          color: Colors.transparent,
        ),
        onChanged: (String newValue) {
          if(widget.onChanged !=null){
            widget.onChanged(newValue);
          }
          setState(() {
            selectedValue=newValue;
          });
        },
        items: list
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value == 'empty' ? '베드 선택' : value,
              style: TextStyle(color: Colors.black54),
            ),
          );
        }).toList(),
      ),
    );
  }
}



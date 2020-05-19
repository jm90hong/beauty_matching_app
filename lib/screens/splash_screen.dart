import 'package:beautymatchingapp/constant/k_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  static const id='splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //todo [step1] 로그인 체크


  }




  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('[로고] 뷰티 매칭 앱',
                      style: TextStyle(
                        fontSize:30,
                        color: kAppMainColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            //로그인 버튼 => 구글 / 카카오톡 / 네이버
             Column(
               children: <Widget>[
                 _buildLoginButton(loginProvider: 'google',onTap: (){print('1');}),
                 SizedBox(height: 20,),
                 _buildLoginButton(loginProvider: 'kakao',onTap: (){print('1');}),
                 SizedBox(height: 20,),
                 _buildLoginButton(loginProvider: 'naver',onTap: (){print('1');}),
                 SizedBox(height: 35,),
               ],
             )
          ],
        ),
      ),
    );
  }

}


Widget _buildLoginButton({String loginProvider,Function onTap}){
  Color btnColor;
  String btnText;
  Color textColor=Colors.white;
  if(loginProvider=='google'){
    btnColor=Color(0xff4688f1);
    btnText='구글 계정으로 로그인';
  }else if(loginProvider=='kakao'){
    btnColor=Color(0xfffcee00);
    btnText='카카오 계정으로 로그인';
    textColor=Color(0xff3c1e1e);
  }else{
    btnColor=Color(0xff1ed800);
    btnText='네이버 계정으로 로그인';
  }

  return Material(
    borderRadius: BorderRadius.circular(20),
    color: btnColor,
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap:onTap,
      child: Container(
        width: 280,
        padding: EdgeInsets.symmetric(vertical:14,horizontal: 30),
        child: Center(
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/sns-login/$loginProvider-letter.png',width: 26,),
                SizedBox(width:20,),
                Text(btnText,
                  style: TextStyle(color:textColor,fontSize:16,fontWeight: FontWeight.bold),),
              ],
            )
        ),
      ),
    ),
  );
}
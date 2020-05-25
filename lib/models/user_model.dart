

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/all.dart';


class UserModel with ChangeNotifier {
  FirebaseAuth _auth;
  var appUser=null;






  //todo googlelogin...
  Future<String> startGoogleLogin() async{
    _auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount account = await googleSignIn.signIn();
    GoogleSignInAuthentication authentication = await account.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential( idToken: authentication.idToken, accessToken: authentication.accessToken);
    AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    print(user.email+' '+user.displayName);
    if(user !=null){
      return 'ok';
    }else{
      return 'fail';
    }
  }


  //todo kakaologin...
  Future<String> startKakaoLogin() async{
    try {
      String authCode = await AuthCodeClient.instance.requestWithTalk();
      AccessTokenResponse token = await AuthApi.instance.issueAccessToken(authCode);
      await AccessTokenStore.instance.toStore(token);
      var user =  await UserApi.instance.me();
      //Session 에 저장
      //user.id / user.kakaoAccount.profile.nickname
      print(user.id.toString()+' '+user.kakaoAccount.profile.nickname);

      return 'ok';
    }on KakaoAuthException catch (e){
      // some error happened during the course of user login... deal with it.
      print('e1 : ${e.message}');
      return 'fail';
    }on KakaoClientException catch (e){
      print('e2 : ${e.message}');
      return 'fail';
    }catch (e){
      print('e3 : $e');
      return 'fail';
    }
  }


  //todo naver login
  Future<String> startNaverLogin() async{
    try{
      NaverLoginResult res = await FlutterNaverLogin.logIn();
      String email = res.account.email;
      String nickname = res.account.nickname;
      print('naver : $email   $nickname');
      return 'ok';
    }catch(e){
      return 'fail';
    }
  }

}
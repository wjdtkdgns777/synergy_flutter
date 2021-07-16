
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/signup_presenter.dart';
import 'package:synergy_flutter/app/pages/sign_up/signup_view.dart';
import 'package:synergy_flutter/app/pages/welcome/welcome_presenter.dart';
import 'dart:developer';

class SignUpController extends Controller {
  SignUpPresenter _signUpPresenter;
  SignUpController() : _signUpPresenter = SignUpPresenter();
  final idEditController = TextEditingController();
  final pwEditController = TextEditingController();
  final usernameEditController = TextEditingController();
  final emailEditController = TextEditingController();
  bool idValidate = false;
  bool pwValidate = false;
  bool usernameValidate = false;
  bool emailValidate = false;

  @override
  void initListeners() {
    idEditController.addListener(_checkIdEditText);
    pwEditController.addListener(_checkPwEditText);
    usernameEditController.addListener(_checkUserNameEditText);
    emailEditController.addListener(_checkEmailEditText);
  }

  void onClickLogin() {
    //Navigator.push(getContext(), MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void onClickSignUp() {
    Navigator.push(getContext(), MaterialPageRoute(builder: (context) => SignUpPage()));
  }

 void _checkIdEditText(){
   //log('id change detected : ${idEditController.text}');
   //규칙 : 3~20자 사이 영문소문자 + 숫자. 영문으로 시작되어야 함
  RegExp regex = new RegExp(r'^[a-z]{1}[a-z0-9]{2,20}$');
  if(regex.hasMatch(idEditController.text)){
    log('id okay');
    idValidate = true;
  }else{
    log('id not okay');
    idValidate = false;
  }
 }

void _checkPwEditText(){
   //log('pw change detected : ${pwEditController.text}');
   //규칙 : 6~20자로 이루어져있어야 함
   int pwLen = pwEditController.text.length;
    if((pwLen >= 6) && (pwLen <= 20)){
      log('pw okay');
      pwValidate = true;
    }else{
      log('pw not okay');
      pwValidate = false;
    }
 }

 void _checkUserNameEditText(){
   //log('username change detected : ${usernameEditController.text}');
   //규칙 : 기존의 닉네임과 겹치지 않아야 함
  if(true){
    log('username okay');
    usernameValidate = true;
  }else{
    log('username not okay');
    usernameValidate = false;
  }
 }

 void _checkEmailEditText(){
   //log('email change detected : ${emailEditController.text}');
   //규칙 : @이 포함되어있어야 함
  if (emailEditController.text.contains("@")){
    log('okay email');
    emailValidate = true;
  }else{
    log('not email');
    emailValidate = false;
  }
 }
  
 bool _isValidate(){
   if(idValidate && pwValidate && usernameValidate && emailValidate){
     return true;
   }
   return false;
 }

  @override
  void onDisposed() {
    super.onDisposed();
    _signUpPresenter.dispose();
  }

  
}

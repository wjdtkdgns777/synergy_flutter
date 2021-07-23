import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/bottom_tab/bottomTab_view.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/sign_up_presenter.dart';
import 'package:synergy_flutter/app/pages/sign_up/sign_up_view.dart';

class SignUpController extends Controller {
  SignUpPresenter _signUpPresenter;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool pwValidate = false;
  bool usernameValidate = false;
  bool emailValidate = false;

  SignUpController(dataUserRepository)
      : _signUpPresenter = SignUpPresenter(dataUserRepository);

  @override
  void initListeners() {
    _signUpPresenter.signUpNext = (bool result) {
      if (result) {
        Navigator.pushAndRemoveUntil(
            getContext(),
            MaterialPageRoute(builder: (context) => BottomTab()),
            (route) => false);
      } else
        print("Login Fail");
    };
    _signUpPresenter.signUpComplete = () {
      print('User retrieved');
    };
    _signUpPresenter.signUpError = (e) {
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      refreshUI(); // Refreshes the UI manually
    };

    passwordController.addListener(_checkPwEditText);
    usernameController.addListener(_checkUserNameEditText);
    emailController.addListener(_checkEmailEditText);
  }

  void onClickSignUp() {
    if (_isValidate()) {
      //회원가입

      _signUpPresenter.signUp(emailController.text, passwordController.text);
    } else {
      //회원가입 실패
      final failSnackBar = SnackBar(
        content: Text('올바른 정보를 입력하십시오.'),
      );
      ScaffoldMessenger.of(getContext()).showSnackBar(failSnackBar);
    }
  }

  void _checkPwEditText() {
    //log('pw change detected : ${pwEditController.text}');
    //규칙 : 6~20자로 이루어져있어야 함
    int pwLen = passwordController.text.length;
    if ((pwLen >= 6) && (pwLen <= 20)) {
      log('pw okay');
      pwValidate = true;
    } else {
      log('pw not okay');
      pwValidate = false;
    }
  }

  void _checkUserNameEditText() {
    //log('username change detected : ${usernameEditController.text}');
    //규칙 : 기존의 닉네임과 겹치지 않아야 함
    /*_signUpPresenter.hasUserName = (usernameEditController.text){
    if(true){
      log('username okay');
      usernameValidate = true;
    }else{
      log('username not okay');
      usernameValidate = false;
    }
   }*/
    usernameValidate = true;
  }

  void _checkEmailEditText() {
    //log('email change detected : ${emailEditController.text}');
    //규칙 : @이 포함되어있어야 함
    if (emailController.text.contains("@")) {
      log('okay email');
      emailValidate = true;
    } else {
      log('not email');
      emailValidate = false;
    }
  }

  bool _isValidate() {
    if (pwValidate && usernameValidate && emailValidate) {
      return true;
    }
    return false;
  }

  @override
  void onDisposed() {
    _signUpPresenter.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onDisposed();
  }
}

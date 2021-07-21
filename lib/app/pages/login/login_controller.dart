import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/bottom_tab/bottomTab_view.dart';
import 'dart:developer';
import 'package:synergy_flutter/app/pages/login/login_presenter.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/signup_view.dart';

class LoginController extends Controller {
  LoginPresenter _loginPresenter;
  TextEditingController emailTextController;
  TextEditingController passTextController;

  LoginController(dataUserRepository)
      : _loginPresenter = LoginPresenter(dataUserRepository) {
    emailTextController = new TextEditingController();
    passTextController = new TextEditingController();
  }

  @override
  void initListeners() {
    _loginPresenter.loginNext = (bool result) {
      if (result) {
        Navigator.pushAndRemoveUntil(getContext(),
            MaterialPageRoute(builder: (context) => BottomTab()), (route) => false);
      } else
        print("Login Fail");
    };
    _loginPresenter.loginComplete =  () {
      print('User retrieved');
    };
    _loginPresenter.loginError =(e){
      print('Could not retrieve user.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      refreshUI(); // Refreshes the UI manually
    };
  }

  void onClickLogin() {
    _loginPresenter.login(emailTextController.text, passTextController.text);
  }

  void onClickSignUp() {
    Navigator.push(
        getContext(), MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  void onClickLoginWithGoogle(){
    log('google 로그인 시작');
    _loginPresenter.loginWithGoogle();
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _loginPresenter.dispose();
  }


}

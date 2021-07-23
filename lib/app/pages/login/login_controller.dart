import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/bottom_tab/bottomTab_view.dart';

import 'package:synergy_flutter/app/pages/login/login_presenter.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/sign_up_view.dart';
import 'package:synergy_flutter/data/repositories/data_users_repository.dart';

//함수
class LoginController extends Controller {
  LoginPresenter _loginPresenter;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginController(dataUserRepository)
      : _loginPresenter = LoginPresenter(dataUserRepository);

  @override
  void initListeners() {
    _loginPresenter.loginNext = (bool result) {
      if (result) {
        Navigator.pushAndRemoveUntil(
            getContext(),
            MaterialPageRoute(builder: (context) => BottomTab()),
            (route) => false);
      } else
        print("Login Fail");
    };
    _loginPresenter.loginComplete = () {
      print('User retrieved');
    };
    _loginPresenter.loginError = (e) {
      print('Could not retrieve user.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      refreshUI(); // Refreshes the UI manually
    };

    _loginPresenter.googleNext = (UserCredential result) {
      if (result.user!=null) {
        Navigator.pushAndRemoveUntil(
            getContext(),
            MaterialPageRoute(builder: (context) => BottomTab()),
                (route) => false);
      } else
        print("Login Fail");
    };
    _loginPresenter.googleComplete = () {
      print('User retrieved');
    };
    _loginPresenter.googleError = (e) {
      print('Could not retrieve user.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      log(e);
      refreshUI(); // Refreshes the UI manually
    };

  }


  void onClickGoogleLogin() async {
    _loginPresenter.googleLogin();
  }

  // void onClickFacebookLogin() async {
  //   _loginPresenter.facebookLogin();
  // }


  void onClickLogin() {
    // _loginPresenter.login(_emailTextController.text, _passTextController.text);
    _loginPresenter.emailPasswordLogin(
        emailController.text, passwordController.text);
  }


  void onClickSignUp() {
    Navigator.push(
        getContext(), MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  @override
  void onDisposed() {
    // don't forget to dispose of the presenter
    _loginPresenter.dispose();

    // _emailTextController.dispose();
    // _passTextController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onDisposed();
  }
}

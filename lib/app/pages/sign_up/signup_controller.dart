
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/signup_presenter.dart';
import 'package:synergy_flutter/app/pages/sign_up/signup_view.dart';
import 'package:synergy_flutter/app/pages/welcome/welcome_presenter.dart';

class SignUpController extends Controller {
  SignUpPresenter _signUpPresenter;
  SignUpController() : _signUpPresenter = SignUpPresenter();

  @override
  void initListeners() {}

  void onClickLogin() {
    Navigator.push(getContext(), MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void onClickSignUp() {
    Navigator.push(getContext(), MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _signUpPresenter.dispose();
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/signup_view.dart';
import 'package:synergy_flutter/app/pages/welcome/welcome_presenter.dart';

class WelcomeController extends Controller {
  WelcomePresenter _welcomePresenter;
  WelcomeController() : _welcomePresenter = WelcomePresenter();

  @override
  void initListeners() {}

// @override
// void onInitState(){  ScreenUtil.init(
//     BoxConstraints(
//         maxWidth: double.infinity,
//         maxHeight: double.infinity),
//     designSize: Size(360, 690),
//     orientation: Orientation.portrait);}

  void onClickLogin() {
    Navigator.push(getContext(), MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void onClickSignUp() {
    Navigator.push(getContext(), MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _welcomePresenter.dispose();
  }
}

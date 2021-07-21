import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/sign_up_presenter.dart';
import 'package:synergy_flutter/app/pages/sign_up/sign_up_view.dart';

class SignUpController extends Controller {
  SignUpPresenter _signUpPresenter;

  // final idEditController = TextEditingController();
  // final TextEditingController _usernameEditController = TextEditingController();
  // final TextEditingController _emailEditController = TextEditingController();
  // final TextEditingController _passwordEditController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // bool idValidate = false;
  // bool usernameValidate = false;
  // bool emailValidate = false;
  // bool pwValidate = false;

  SignUpController(dataUserRepository)
      : _signUpPresenter = SignUpPresenter(dataUserRepository);

  @override
  void initListeners() {}

  void onClickLogin() {
    Navigator.push(
        getContext(), MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void onClickSignUp() {
    Navigator.push(
        getContext(), MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  void onClickCreateUser() {
    _signUpPresenter.signup(emailController.text, passwordController.text);
  }

  @override
  void onDisposed() {
    // don't forget to dispose of the presenter
    _signUpPresenter.dispose();

    // _usernameEditController.dispose();
    // _emailEditController.dispose();
    // _passwordEditController.dispose();

    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onDisposed();
  }
}

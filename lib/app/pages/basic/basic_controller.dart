import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'basic_presenter.dart';

class CounterController extends Controller {
  int counter;
  final LoginPresenter presenter;
  CounterController() : counter = 0, presenter = LoginPresenter(), super();

  void increment() {
    counter++;
  }

  /// Shows a snackbar
  void showSnackBar() {
    ScaffoldState scaffoldState = getState(); // get the state, in this case, the scaffold
    scaffoldState.showSnackBar(SnackBar(content: Text('Hi')));
  }

  @override
  void initListeners() {
    // Initialize presenter listeners here
    // These will be called upon success, failure, or data retrieval after usecase execution
    presenter.loginOnComplete = () => print('Login Successful');
    presenter.loginOnError = (e) => print(e);
    presenter.loginOnNext = () => print("onNext");
  }

  void login() {
    // pass appropriate credentials here
    // assuming you have text fields to retrieve them and whatnot
    // presenter.login();
  }
}
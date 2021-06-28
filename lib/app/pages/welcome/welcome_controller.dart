import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/welcome/welcome_presenter.dart';

class WelcomeController extends Controller {
  WelcomePresenter _welcomePresenter;
  WelcomeController() : _welcomePresenter = WelcomePresenter();

  @override
  void initListeners() {}



  void onClickLogin() {
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _welcomePresenter.dispose();
  }
}

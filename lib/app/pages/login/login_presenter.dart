import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPresenter extends Presenter {

  LoginPresenter();

  void dispose() {}
}

class _LoginObserver implements Observer<bool> {
  LoginPresenter _welcomePresenter;
  _LoginObserver(this._welcomePresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

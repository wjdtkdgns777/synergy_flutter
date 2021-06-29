import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignUpPresenter extends Presenter {

  SignUpPresenter();

  void dispose() {}
}

class _SignUpObserver implements Observer<bool> {
  SignUpPresenter _signUpPresenter;
  _SignUpObserver(this._signUpPresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

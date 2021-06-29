import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class WelcomePresenter extends Presenter {

  WelcomePresenter();

  void dispose() {}
}

class _WelcomeObserver implements Observer<bool> {
  WelcomePresenter _welcomePresenter;
  _WelcomeObserver(this._welcomePresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

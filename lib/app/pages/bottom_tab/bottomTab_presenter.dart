

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class BottomTabPresenter extends Presenter {

  BottomTabPresenter();

  void dispose() {}
}

class _BottomTabObserver implements Observer<bool> {
  BottomTabPresenter _bottomTabPresenter;
  _BottomTabObserver(this._bottomTabPresenter);

  void onNext(result) {}

  void onComplete() {}

  void onError(e) {}
}

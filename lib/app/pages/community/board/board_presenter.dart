import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class BoardPresenter extends Presenter {

  Function boardNext;
  Function boardComplete;
  Function boardError;

  BoardPresenter();



  void dispose() {
  }
}

class _BoardObserver implements Observer<bool> {
  BoardPresenter _boardPresenter;

  _BoardObserver(this._boardPresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

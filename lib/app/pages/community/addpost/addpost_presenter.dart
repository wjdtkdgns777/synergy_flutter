import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddPostPresenter extends Presenter {

  Function addpostNext;
  Function addpostComplete;
  Function addpostError;

  AddPostPresenter();



  void dispose() {
  }
}

class _AddPostObserver implements Observer<bool> {
  AddPostPresenter _addpostPresenter;

  _AddPostObserver(this._addpostPresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostPresenter extends Presenter {

  Function postNext;
  Function postComplete;
  Function postError;

  PostPresenter();



  void dispose() {
  }
}

class _PostObserver implements Observer<bool> {
  PostPresenter _postPresenter;

  _PostObserver(this._postPresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

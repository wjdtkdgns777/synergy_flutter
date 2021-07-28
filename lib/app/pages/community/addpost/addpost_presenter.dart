import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddPostPresenter extends Presenter {

  Function addpostNext;
  Function addpostComplete;
  Function addpostError;

  AddPostPresenter();

  void submitPost(String title, String content){
    //_submitPostUseCase = SubmitUseCase(String title, String content);
  }

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

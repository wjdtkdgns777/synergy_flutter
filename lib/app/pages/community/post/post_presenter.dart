import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostPresenter extends Presenter {
  //SubmitCommentUseCase _submitCommentUseCase;

  Function postNext;
  Function postComplete;
  Function postError;

  PostPresenter(dataUserRepository);

  void submitComment(String comment){
    //_submitCommentUseCase.execute(_SubmitCommentObserver(this), SubmitCommentUseCaseParams(comment));
  }

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

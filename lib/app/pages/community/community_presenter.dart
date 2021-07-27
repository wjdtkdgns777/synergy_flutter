import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CommunityPresenter extends Presenter {

  Function communityNext;
  Function communityComplete;
  Function communityError;

  CommunityPresenter();



  void dispose() {
  }
}

class _CommunityObserver implements Observer<bool> {
  CommunityPresenter _communityPresenter;

  _CommunityObserver(this._communityPresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

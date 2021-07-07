
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfilePresenter extends Presenter {

  ProfilePresenter() {}

  void dispose() {}
}

class _ProfileObserver implements Observer<bool> {
  ProfilePresenter _profilePresenter;
  _ProfileObserver(this._profilePresenter);

  void onNext(result) {}

  void onComplete() {}

  void onError(e) {}
}

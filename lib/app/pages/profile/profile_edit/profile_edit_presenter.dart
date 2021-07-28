
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfileEditPresenter extends Presenter {

  ProfileEditPresenter() {}

  void dispose() {}
}

class _ProfileObserver implements Observer<bool> {
  ProfileEditPresenter _profilePresenter;
  _ProfileObserver(this._profilePresenter);

  void onNext(result) {}

  void onComplete() {}

  void onError(e) {}
}

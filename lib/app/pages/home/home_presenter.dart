import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';


class HomePresenter extends Presenter {

  HomePresenter();

  void dispose() {}
}

class _HomeObserver implements Observer<bool> {
  HomePresenter _homePresenter;
  _HomeObserver(this._homePresenter);

  void onNext(result) {}

  void onComplete() {}

  void onError(e) {}
}

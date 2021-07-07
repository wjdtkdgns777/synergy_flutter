

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ExamplePresenter extends Presenter {

  ExamplePresenter() {}

  void dispose() {}
}

class _ExampleObserver implements Observer<bool> {
  ExamplePresenter _examplePresenter;
  _ExampleObserver(this._examplePresenter);

  void onNext(result) {}

  void onComplete() {}

  void onError(e) {}
}



import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/example/example_presenter.dart';

class ExampleController extends Controller {
  ExamplePresenter _examplePresenter;

  ExampleController() : _examplePresenter = ExamplePresenter() {}

  @override
  void initListeners() {}

  void onTap() {
   print("onTap");
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _examplePresenter.dispose();
  }
}

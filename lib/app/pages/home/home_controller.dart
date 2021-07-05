

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'home_presenter.dart';

class HomeController extends Controller {
  HomePresenter _homePresenter;

  HomeController() : _homePresenter = HomePresenter() {}

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    super.onDisposed();
    _homePresenter.dispose();
  }
}

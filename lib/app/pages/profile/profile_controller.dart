

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/example/example_presenter.dart';
import 'package:synergy_flutter/app/pages/profile/profile_presenter.dart';

class ProfileController extends Controller {
  ProfilePresenter _profilePresenter;

  ProfileController() : _profilePresenter = ProfilePresenter() {}

  @override
  void initListeners() {}

  void onTap() {
    print("onTap");
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _profilePresenter.dispose();
  }
}

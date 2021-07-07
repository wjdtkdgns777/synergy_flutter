
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synergy_flutter/app/pages/announcement/announcement.dart';
import 'package:synergy_flutter/app/pages/community/community_view.dart';
import 'package:synergy_flutter/app/pages/home/home_view.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/profile/profile.dart';
import 'package:synergy_flutter/app/pages/profile/profile_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/signup_view.dart';
import 'package:synergy_flutter/app/pages/welcome/welcome_presenter.dart';
import 'package:synergy_flutter/app/pages/welcome/welcome_view.dart';

import 'bottomTab_view.dart';

class BottomTabController extends Controller {
  WelcomePresenter _welcomePresenter;
  BottomTabController() : _welcomePresenter = WelcomePresenter();

  int currentIndex = 0;
  final List<Widget> children = [
    HomePage(),
    Announcement(),
    Community(),
    Profile()
  ];
  @override
  void initListeners() {}

  void onTap(int index) {
      currentIndex = index;
      refreshUI();
  }

  void signout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(getContext(),
        MaterialPageRoute(builder: (context) => WelcomePage()), (route) => false);
  }


  @override
  void onDisposed() {
    super.onDisposed();
    _welcomePresenter.dispose();
  }
}

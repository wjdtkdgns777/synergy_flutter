import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:provider/provider.dart';
import 'package:synergy_flutter/app/components/show_alert_dialog.dart';
import 'package:synergy_flutter/app/pages/welcome/welcome_view.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

import 'home_presenter.dart';

class HomeController extends Controller {
  HomePresenter _homePresenter;

  HomeController() : _homePresenter = HomePresenter() {}

  @override
  void initListeners() {}

  // Future<void> _signOut(BuildContext context) async {
  //   try {
  //     //because this class is a stateless widget, then the context is only available inside the build method
  //     //so parameter(BuildContext context) add.
  //     final auth = Provider.of<UsersRepository>(context, listen: false);
  //     await auth.signOut();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        getContext(),
        MaterialPageRoute(builder: (context) => WelcomePage()),
            (route) => false);
  }

  // Future<void> _confirmSignOut(BuildContext context) async {
  //   //this can return true, false or null(system back button)
  //   final didRequestSignOut = await showAlertDialog(
  //     context,
  //     title: 'Logout',
  //     content: 'Are you sure that you want to logout?',
  //     cancelActionText: 'Cancel',
  //     defaultActionText: 'Logout',
  //   );
  //   if (didRequestSignOut == true) {
  //     _signOut(context);
  //   }
  // }

  @override
  void onDisposed() {
    super.onDisposed();
    _homePresenter.dispose();
  }
}

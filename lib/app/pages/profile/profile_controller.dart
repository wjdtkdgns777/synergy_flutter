import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get/get.dart';
import 'package:synergy_flutter/app/pages/profile/profile_edit/profile_edit_view.dart';
import 'package:synergy_flutter/app/pages/profile/profile_presenter.dart';
import 'package:synergy_flutter/app/pages/welcome/welcome_view.dart';
import 'package:synergy_flutter/data/utils/firebase.dart';

class ProfileController extends Controller {
  ProfilePresenter _profilePresenter;

  ProfileController() : _profilePresenter = ProfilePresenter() {}

  @override
  void initListeners() {}

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  String myWord='';

  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        getContext(),
        MaterialPageRoute(builder: (context) => WelcomePage()),
        (route) => false);
  }

  void editProfile() {
    Navigator.push(getContext(),
        MaterialPageRoute(builder: (context) => ProfileEditPage()));
  }

  String getMyWord() {
    fireStore
        .collection('users')
        .doc(firebaseAuth.currentUser.uid)
        .get()
        .then((DocumentSnapshot ds) {
      myWord = ds['MyWord'];
    }).catchError((onError) => print(onError));

    return myWord;

  }

  @override
  void onInitState() {
    getMyWord();
    super.onInitState();
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _profilePresenter.dispose();
  }
}

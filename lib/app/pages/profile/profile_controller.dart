
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:image_picker/image_picker.dart';
import 'package:synergy_flutter/app/pages/example/example_presenter.dart';
import 'package:synergy_flutter/app/pages/profile/profile_presenter.dart';
import 'package:synergy_flutter/app/pages/welcome/welcome_view.dart';

class ProfileController extends Controller {
  ProfilePresenter _profilePresenter;

  ProfileController() : _profilePresenter = ProfilePresenter() {}

  @override
  void initListeners() {}

  XFile image;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        getContext(),
        MaterialPageRoute(builder: (context) => WelcomePage()),
            (route) => false);
  }

  void uploadImageToStorage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile images = await _picker.pickImage(source: source);

    if (images == null) return;
      image = images;
    

    // 프로필 사진을 업로드할 경로와 파일명을 정의. 사용자의 uid를 이용하여 파일명의 중복 가능성 제거
    Reference storageReference = firebaseStorage
        .ref()
        .child("profile/${firebaseAuth.currentUser.uid}");

    // 파일 업로드
    UploadTask storageUploadTask = storageReference.putFile(File(image.path));

    // 파일 업로드 완료까지 대기
    await storageUploadTask.whenComplete(() => null);

    // 업로드한 사진의 URL 획득
    String downloadURL = await storageReference.getDownloadURL();

    firebaseAuth.currentUser.updatePhotoURL(downloadURL);


    // 업로드된 사진의 URL을 페이지에 반영
  }
  @override
  void onDisposed() {
    super.onDisposed();
    _profilePresenter.dispose();
  }
 
}

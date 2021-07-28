import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:synergy_flutter/app/pages/profile/profile_edit/profile_edit_controller.dart';

class ProfileEditPage extends View {
  ProfileEditPage();

  @override
  _ProfileEditPageView createState() =>
      _ProfileEditPageView(ProfileEditController());
}

class _ProfileEditPageView
    extends ViewState<ProfileEditPage, ProfileEditController> {
  _ProfileEditPageView(ProfileEditController controller) : super(controller);

  @override
  Widget get view => ControlledWidgetBuilder<ProfileEditController>(
          builder: (context, controller) {
        return Scaffold(
            key: globalKey,
            appBar: appBar(controller),
            body: Column(
              children: [
                profileTop(controller),
                SizedBox(height: 16),
                editInput(controller)
              ],
            ));
      });

  Column editInput(ProfileEditController controller) {
    return Column(
      children: [
        Text(
          controller.firebaseAuth.currentUser.displayName.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          "언제나 발전하는 플러터 개발자",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Stack profileTop(ProfileEditController controller) {
    return Stack(children: [
      Container(
        height: 100,
        color: Colors.black,
      ),
      Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 33),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 65,
        ),
      ),
      Container(
          padding: EdgeInsets.only(top: 38),
          alignment: Alignment.center,
          child: Column(children: [
            CircleAvatar(
              backgroundImage: (controller.firebaseAuth.currentUser.photoURL !=
                      null)
                  ? NetworkImage(controller.firebaseAuth.currentUser.photoURL)
                  : NetworkImage(""),
              radius: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Gallery"),
                  onPressed: () {
                    controller.uploadImageToStorage(ImageSource.gallery);
                  },
                ),
                RaisedButton(
                  child: Text("Camera"),
                  onPressed: () {
                    controller.uploadImageToStorage(ImageSource.camera);
                  },
                )
              ],
            ),
            SizedBox(height: 16),
          ]))
    ]);
  }

  AppBar appBar(ProfileEditController controller) {
    return AppBar(
      title: Text(
        '프로필 수정',
        style: TextStyle(color: Colors.white),
      ),

      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            controller.onEdit();
          },
          color: Colors.white,
        ),

      ],
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
}

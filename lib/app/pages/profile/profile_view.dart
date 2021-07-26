import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/profile/profile_controller.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends View {
  ProfilePage();

  @override
  _ProfilePageView createState() => _ProfilePageView(ProfileController());
}

class _ProfilePageView extends ViewState<ProfilePage, ProfileController> {
  _ProfilePageView(ProfileController controller) : super(controller);

  @override
  Widget get view => ControlledWidgetBuilder<ProfileController>(
          builder: (context, controller) {
        return Scaffold(
            key: globalKey,
            appBar: AppBar(
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  controller.signOut();
                },
                color: Colors.white,
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: Stack(children: [
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
                  child: Column(children: [
                    CircleAvatar(
                      backgroundImage:
                          (controller.firebaseAuth.currentUser.photoURL != null)
                              ? NetworkImage(
                                  controller.firebaseAuth.currentUser.photoURL)
                              : NetworkImage(""),
                      radius: 60,
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 30,
                      child: Text(
                        controller.firebaseAuth.currentUser.email,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              child: Text("Gallery"),
                              onPressed: () {
                                controller
                                    .uploadImageToStorage(ImageSource.gallery);
                              },
                            ),
                            RaisedButton(
                              child: Text("Camera"),
                              onPressed: () {
                                controller
                                    .uploadImageToStorage(ImageSource.camera);
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ]))
            ]));
      });
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/profile/profile_controller.dart';


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
            appBar: appBar(controller),
            body: Column(
              children: [
                profileTop(controller),
                SizedBox(
                  height: 16,
                ),

              ],
            ));
      });

  AppBar appBar(ProfileController controller) {
    return AppBar(
      title: Text(
        '프로필',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            controller.editProfile();
          },
          color: Colors.white,
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            controller.signOut();
          },
          color: Colors.white,
        )
      ],
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  Stack profileTop(ProfileController controller) {
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
            SizedBox(height: 16),
            Container(
              height: 30,
              child: Text(
                controller.firebaseAuth.currentUser.displayName.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
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


          ]))
    ]);
  }


}

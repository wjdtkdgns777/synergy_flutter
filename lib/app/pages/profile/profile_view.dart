import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/example/example_controller.dart';
import 'package:synergy_flutter/app/pages/profile/profile_controller.dart';

class ProfilePage extends View {
  ProfilePage();

  @override
  _ProfilePageView createState() => _ProfilePageView(ProfileController());
}

class _ProfilePageView extends ViewState<ProfilePage, ProfileController> {
  _ProfilePageView(ProfileController controller) : super(controller);


  @override
  Widget get view => Scaffold(key: globalKey, body: body);


  Widget get body =>ControlledWidgetBuilder<ProfileController>(builder: (context, controller)  {
    return InkWell(
      onTap: () {
        controller.onTap();
      },
      child: Text(
        'Example',
        style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
      ),

    );
  });

}

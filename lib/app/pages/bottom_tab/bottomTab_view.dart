import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

import 'bottomTab_controller.dart';

class BottomTab extends View {
  @override
  _BottomTabState createState() => _BottomTabState(BottomTabController());
}

class _BottomTabState extends ViewState<BottomTab, BottomTabController> {
  _BottomTabState(BottomTabController controller) : super(controller);

  @override
  Widget get view => ControlledWidgetBuilder<BottomTabController>(
          builder: (context, controller) {
        return Scaffold(
          key: globalKey,
          appBar: AppBar(
            title: Text(
              'Synergy',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                controller.signOut();
              },
              color: Colors.black,
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFFFFFFFF),
          ),
          body: controller.children[controller.currentIndex],
          bottomNavigationBar: MotionTabBar(
            labels: ["홈", "채용공고", "커뮤니티", "프로필"],
            initialSelectedTab: "홈",
            tabIconColor: const Color(0xFFF2CA99),
            tabSelectedColor: const Color(0xFFF2A516),
            onTabItemSelected: controller.onTap,
            icons: [
              Icons.home,
              Icons.calendar_today_rounded,
              Icons.list_alt_outlined,
              Icons.assignment_ind_outlined
            ],
            textStyle: TextStyle(color: const Color(0xFFF2A516)),
          ),

          // BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     onTap: controller.onTap,
          //     currentIndex: controller.currentIndex,
          //     items: [
          //       new BottomNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         title: Text('홈'),
          //       ),
          //       new BottomNavigationBarItem(
          //         icon: Icon(Icons.calendar_today_rounded),
          //         title: Text('채용공고'),
          //       ),
          //       new BottomNavigationBarItem(
          //         icon: Icon(Icons.list_alt_outlined),
          //         title: Text('커뮤니티'),
          //       ),
          //       new BottomNavigationBarItem(
          //         icon: Icon(Icons.assignment_ind_outlined),
          //         title: Text('프로필'),
          //       ),
          //     ])
        );
      });
}

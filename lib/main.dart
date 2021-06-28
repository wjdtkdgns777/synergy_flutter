import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/pages/announcement/announcement.dart';

import 'app/pages/community/community_view.dart';
import 'app/pages/home/home.dart';
import 'app/pages/profile/profile.dart';
import 'app/pages/welcome/welcome_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter test',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Announcement(),
    Community(),
    Profile()
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Synergy',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFFFFF),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onTap,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('홈'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                title: Text('채용공고'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined),
                title: Text('커뮤니티'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.assignment_ind_outlined),
                title: Text('프로필'),
              ),
            ]));
  }
}

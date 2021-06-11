import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:synergy_flutter/pages/home/home.dart';
import 'package:synergy_flutter/pages/profile/profile.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'pages/announcement/announcement.dart';
import 'pages/chat/rooms.dart';
import 'pages/community/community.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int _currentIndex = 0;
  final List<Widget> _children = [Home(),Chat(), Announcement(),Community(), Profile()];

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
                icon: Icon(Icons.chat_bubble),
                title: Text('채팅'),
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
            ])


        );
  }


}





//todo: aaa

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("hello world"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             RaisedButton(
//
//               child:
//                   Text("create button", style: TextStyle(color: Colors.white)),
//               onPressed: () {
//                 addData(users);
//               },
//               color: Colors.black,
//               //클릭시 데이터를 추가해준다.
//             ),
//             FlatButton(
//               color: Colors.blue,
//               child: Text("read button", style: TextStyle(color: Colors.white)),
//               onPressed: () {
//                GetUserName();
//                // var result =
//                // Text(result.toString(), style: TextStyle(color: Colors.white));
//                 //클릭시 데이터를 읽어준다
//               },
//             ),
//             FlatButton(
//               color: Colors.blue,
//               child:
//                   Text("update button", style: TextStyle(color: Colors.white)),
//               onPressed: () {
//                 //클릭시 데이터를 갱신해준다.
//               },
//             ),
//             FlatButton(
//               color: Colors.blue,
//               child:
//                   Text("delete button", style: TextStyle(color: Colors.white)),
//               onPressed: () {
//                 //클릭시 데이터를 삭제해 준다.
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> addData(CollectionReference users) {
//     // Call the user's CollectionReference to add a new user
//     return users
//         .add({
//           'full_name': "fullName", // John Doe
//           'company': "company", // Stokes and Sons
//           'age': "age" // 42
//         })
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }
//
//   Future<void> readData(CollectionReference users) {
//     // Call the user's CollectionReference to add a new user
//     return users
//         .add({
//       'full_name': "fullName", // John Doe
//       'company': "company", // Stokes and Sons
//       'age': "age" // 42
//     })
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }
// }
// class GetUserName extends StatelessWidget {
//   final String documentId ;
//
//   GetUserName({this.documentId = "F1tLGBIHjk4SQrIoL1KM"});
//
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }
//
//         if (snapshot.hasData && !snapshot.data.exists) {
//           return Text("Document does not exist");
//         }
//
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data.data();
//           print("Full Name: ${data['full_name']} ${data['age']}");
//           return Text("Full Name: ${data['full_name']} ${data['age']}");
//
//
//         }
//
//         return Text("loading");
//       },
//     );
//   }
// }
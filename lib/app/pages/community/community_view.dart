import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:synergy_flutter/app/components/stream_builder_wrapper.dart';
import 'package:synergy_flutter/data/utils/firebase.dart';
import 'package:synergy_flutter/domain/entities/post.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  final  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Community',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: false,
        // actions: [
        //   IconButton(
        //     icon: Icon(CupertinoIcons.chat_bubble_2_fill,
        //         size: 30.0, color: Theme.of(context).accentColor),
        //     onPressed: () {
        //       Navigator.push(
        //           context, CupertinoPageRoute(builder: (_) => Chats()));
        //     },
        //   ),
        //   SizedBox(width: 20.0),
        // ],
      ),
       body: SizedBox.shrink());

  }

  internetChecker() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      showInSnackBar('No Internet Connecton');
    }
  }

  void showInSnackBar(String value) {
    scaffoldKey.currentState.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }
}



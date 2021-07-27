import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:synergy_flutter/app/components/stream_builder_wrapper.dart';
import 'package:synergy_flutter/data/utils/firebase.dart';
import 'package:synergy_flutter/domain/entities/post.dart';
import 'package:synergy_flutter/app/pages/community/community_controller.dart';

class Community extends View {
  @override
  _CommunityState createState() => _CommunityState(CommunityController());
}

class _CommunityState extends ViewState<Community, CommunityController> {
  _CommunityState(CommunityController controller): super(controller);

  final  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget get view => ControlledWidgetBuilder<CommunityController>(
    builder: (context, controller){
      return Scaffold(
          key: scaffoldKey,

          //body: SingleChildScrollView(
          body: Container(
              //child: Container(
                decoration: BoxDecoration(color: Colors.grey[300],),
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30,),
                    Container(
                    margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child:Column(
                        children: <Widget>[
                          SizedBox(height: 15,),
                          _boardBox,

                        ],
                      )
                  ),

                  ],
                )
              )
          );
    }
  );

  internetChecker() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      showInSnackBar('No Internet Connecton');
    }
  }

  Widget get _boardBox =>
    ControlledWidgetBuilder<CommunityController>(builder: (context, controller){
      return Column(
        children: <Widget>[
          Divider(thickness: 1, color: Colors.grey[300]),
          _Board("자유게시판", "Free Board", 0, controller),
          Divider(thickness: 1,color: Colors.grey[300],),
          _Board("게시판1", "Board1", 1, controller),
          Divider(thickness: 1,color: Colors.grey[300],),
          _Board("게시판2", "Board2", 2, controller),
          Divider(thickness: 1,color: Colors.grey[300],),
          _Board("게시판3", "Board3", 3, controller),
          Divider(thickness: 1,color: Colors.grey[300],),

        ]
      );
    });

  Widget _Board(String korTitle, String engTitle, int boardOption, CommunityController controller){
    return InkWell(
        onTap: (){
          controller.onBoardClicked(boardOption);
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 10),

            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Icon(Icons.dashboard_outlined),
                SizedBox(width: 10,),
                Text(korTitle,
                    style: TextStyle(fontSize: 23,)),
                SizedBox(width: 10),
                Text(engTitle,
                  style: TextStyle(fontSize: 15, color: Colors.grey),)
              ],
            )
        )
    );
  }



  void showInSnackBar(String value) {
    scaffoldKey.currentState.removeCurrentSnackBar();
    //globalKey.currentState.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }
}



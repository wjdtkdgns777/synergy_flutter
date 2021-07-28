import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:developer';
import 'package:synergy_flutter/app/pages/community/board/board_view.dart';

class CommunityController extends Controller{

  CommunityController();

  @override
  void initListeners() {

  }

  void onBoardClicked(int boardOption, BuildContext context){
    if(boardOption == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BoardView())
      );
      //Navigator.pushNamed(context, 'boardview');
    }
    else{
      log('나머지 게시판');
    }
  }

  @override
  void onDisposed() {

  }
}
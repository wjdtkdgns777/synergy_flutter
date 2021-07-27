import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:developer';

class CommunityController extends Controller{

  CommunityController();

  @override
  void initListeners() {

  }

  void onBoardClicked(int boardOption){
    if(boardOption == 0){
      log('자유게시판');
    }
    else{
      log('나머지 게시판');
    }
  }

  @override
  void onDisposed() {

  }
}
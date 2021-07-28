import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:synergy_flutter/app/pages/community/board/board_view.dart';
import 'package:synergy_flutter/app/pages/community/board/board_presenter.dart';

class BoardController extends Controller{
  BoardPresenter _boardPresenter;

  ScrollController scrollController;
  List<DocumentSnapshot> post = [];
  bool isLoading = false;
  DocumentSnapshot lastDocument;
  int pageNum = 1;
  List<Map<String, dynamic>> posts;
  Future<List<Map<String, dynamic>>> future;
  int totalRecord = 0;

  BoardController()
    : _boardPresenter = BoardPresenter();

  @override
  void initListeners() {
    future = getPosts();
    scrollController = new ScrollController()..addListener(_scrollListener);

  }

  Future<List<Map<String, dynamic>>> getPosts() async{

    isLoading = true;
    /*final res = await _boardPresenter.getPosts();
    Map<String, dynamic> dicRes = json.decode(res.body);
    List<Map<String, dynamic>> tempArray = List<Map<String, dynamic>>.from(dicRes["data"]["products"]);
    setState((){
      if(pageNum == 1){
        totalRecord = dicRes["total_record"];
        posts = tempArray;

      }else{
        posts.addAll(tempArray);
      }
      pageNum++;
    });*/
    return posts;
  }

  _scrollListener(){
    if(totalRecord == posts.length){
      return;
    }
    if(scrollController.position.extentAfter >= 0 && isLoading == false){
      getPosts();
    }
  }

  @override
  void onDisposed() {

  }
}
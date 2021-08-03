import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:synergy_flutter/app/pages/community/board/board_view.dart';
import 'package:synergy_flutter/app/pages/community/board/board_presenter.dart';
import 'package:synergy_flutter/data/models/post.dart';
import 'package:synergy_flutter/app/pages/community/post/post_view.dart';

class BoardController extends Controller{
  BoardPresenter _boardPresenter;

  ScrollController scrollController;
  List<DocumentSnapshot> post = [];
  bool isLoading = false;
  DocumentSnapshot lastDocument;
  int pageNum = 1;
  List<Post> posts;
  Future<List<Post>> future;
  int totalRecord = 0;

  BoardController(dataUserRepository)
    : _boardPresenter = BoardPresenter(dataUserRepository);

  @override
  void initListeners() {
    future = getPosts();
    scrollController = new ScrollController()..addListener(_scrollListener);

  }

  Future<List<Post>> getPosts() async{

    isLoading = true;
    posts = _boardPresenter.getPosts();
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

  onPostSelected(BuildContext context, Post post){
    //Post 클릭
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostView(post))
    );
  }

  onDeletePost(BuildContext context, Post post){
    _boardPresenter.deletePost(post);
  }

  @override
  void onDisposed() {

  }
}
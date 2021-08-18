import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:developer';
import 'post_presenter.dart';

class PostController extends Controller{
  PostPresenter _postPresenter;

  final TextEditingController commentController = TextEditingController();

  PostController(dataUserRepository)
    : _postPresenter = PostPresenter(dataUserRepository);

  @override
  void initListeners() {

  }

  void onClickCommentBtn(){
    _postPresenter.submitComment(commentController.text);
    refreshUI();
  }

  @override
  void onDisposed() {

  }
}
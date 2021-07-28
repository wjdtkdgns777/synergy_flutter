import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:developer';
import 'package:synergy_flutter/app/pages/community/addpost/addpost_presenter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class AddPostController extends Controller{
  AddPostPresenter _addPostPresenter;

  String selectedFileList = "";
  File selectedFile;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  AddPostController()
    : _addPostPresenter = AddPostPresenter();

  @override
  void initListeners() {

  }

  selectFile() async{
    /*selectedFile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'mp4']
    );*/
}

  void onClickSubmit(){
    _addPostPresenter.submitPost(titleController.text, contentController.text);
    Navigator.pop(getContext());
  }

  @override
  void onDisposed() {

  }
}
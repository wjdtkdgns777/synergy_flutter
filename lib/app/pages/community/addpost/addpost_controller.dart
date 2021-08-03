import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:developer';
import 'package:synergy_flutter/app/pages/community/addpost/addpost_presenter.dart';
import 'package:synergy_flutter/app/pages/community/addpost/addpost_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:synergy_flutter/data/models/post.dart';

class AddPostController extends Controller{
  AddPostPresenter _addPostPresenter;

  String selectedFileList = "";
  List<File> selectedFile = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  AddPostController(dataUserRepository)
    : _addPostPresenter = AddPostPresenter(dataUserRepository);

  @override
  void initListeners() {

  }

  selectFile() async{
    /*selectedFile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'mp4']
    );*/
    FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if(result != null){
      log(result.paths.length.toString());
      result.paths.forEach((element) {
        File file = File(element);
        selectedFile.add(file);
        selectedFileList += basename(file.path) + '\n';
        log(selectedFileList);
      });
      refreshUI();
    }
    else{
      //User canceled the picker
    }
}

  void onClickSubmit(){
    if(titleController.text == ""){
      final failSnackBar = SnackBar(
        content: Text('제목을 입력하십시오.'),
      );
      ScaffoldMessenger.of(getContext()).showSnackBar(failSnackBar);
    }
    else if(contentController.text == ""){
      final failSnackBar = SnackBar(
        content: Text('내용을 입력하십시오.'),
      );
      ScaffoldMessenger.of(getContext()).showSnackBar(failSnackBar);
    }else{
      _addPostPresenter.submitPost(titleController.text, contentController.text, selectedFile);
      Navigator.pop(getContext());
    }
  }

  @override
  void onDisposed() {

  }
}
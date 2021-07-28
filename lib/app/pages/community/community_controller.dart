import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:provider/provider.dart';
import 'package:synergy_flutter/app/components/show_alert_dialog.dart';
import 'package:synergy_flutter/app/components/show_exception_alert_dialog.dart';
import 'dart:developer';
import 'package:synergy_flutter/app/pages/community/board/board_view.dart';
import 'package:synergy_flutter/app/pages/community/community_presenter.dart';
import 'package:synergy_flutter/data/models/post.dart';
import 'package:synergy_flutter/data/utils/database.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

class CommunityController extends Controller {
  CommunityPresenter _communityPresenter;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  CommunityController(dataUserRepository)
      : _communityPresenter = CommunityPresenter(dataUserRepository);

  @override
  void initListeners() {}

  // void onBoardClicked(int boardOption, BuildContext context) {
  //   if (boardOption == 0) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => BoardView()));
  //     //Navigator.pushNamed(context, 'boardview');
  //   } else {
  //     log('나머지 게시판');
  //   }
  // }

  @override
  void onDisposed() {
    _communityPresenter.dispose();
    titleController.dispose();
    contentController.dispose();
  }
}

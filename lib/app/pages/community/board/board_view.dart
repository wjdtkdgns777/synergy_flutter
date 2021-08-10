import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:synergy_flutter/data/repositories/data_users_repository.dart';
import 'board_controller.dart';
import 'dart:developer';
import 'package:synergy_flutter/domain/entities/post.dart';
import 'package:synergy_flutter/app/pages/community/addpost/addpost_view.dart';
import 'package:synergy_flutter/data/models/post.dart';
import 'package:synergy_flutter/app/components/list_items_builder.dart';
import 'dart:ui';
import 'package:synergy_flutter/app/components/post_list_tile.dart';

class BoardView extends View {
  @override
  _BoardViewState createState() =>
      _BoardViewState(BoardController(DataUsersRepository()));
}

class _BoardViewState extends ViewState<BoardView, BoardController> {
  _BoardViewState(BoardController controller) : super(controller);

  @override
  Widget get view => Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(
          'Board',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPostView()));
            },
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: _postList);

  internetChecker() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      showInSnackBar('No Internet Connecton', context);
    }
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  Widget get _postList =>
      ControlledWidgetBuilder<BoardController>(builder: (context, controller) {
        return Container(
          child: StreamBuilder<List<Post>>(builder: (context, snapshot) {
            return ListItemsBuilder<Post>(
              snapshot: snapshot,
              itemBuilder: (context, post) => Dismissible(
                  key: Key('post-${post.title}'),
                  background: Container(
                    color: Colors.grey[700],
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) =>
                      controller.onDeletePost(context, post),
                  child: PostListTile(
                      post: post,
                      onTap: () => controller.onPostSelected(context, post))),
            );
          }),
        );
      });
}

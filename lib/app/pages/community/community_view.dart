import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:synergy_flutter/app/components/list_items_builder.dart';
import 'package:synergy_flutter/app/components/post_list_tile.dart';
import 'package:synergy_flutter/app/components/show_alert_dialog.dart';
import 'package:synergy_flutter/app/components/show_exception_alert_dialog.dart';
import 'package:synergy_flutter/app/components/stream_builder_wrapper.dart';
import 'package:synergy_flutter/app/pages/community/post/post_view.dart';
import 'package:synergy_flutter/data/models/post.dart';
import 'package:synergy_flutter/data/repositories/data_users_repository.dart';
import 'package:synergy_flutter/data/utils/database.dart';
import 'package:synergy_flutter/data/utils/firebase.dart';
import 'package:synergy_flutter/domain/entities/post.dart';
import 'package:synergy_flutter/app/pages/community/community_controller.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

import 'board/board_view.dart';

// class Community extends View {
//   @override
//   _CommunityState createState() =>
//       _CommunityState(CommunityController(DataUsersRepository()));
//
//   Future<void> _signOut(BuildContext context) async {
//     try {
//       //because this class is a stateless widget, then the context is only available inside the build method
//       //so parameter(BuildContext context) add.
//       final auth = Provider.of<UsersRepository>(context, listen: false);
//       await auth.signOut();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   Future<void> _confirmSignOut(BuildContext context) async {
//     //this can return true, false or null(system back button)
//     final didRequestSignOut = await showAlertDialog(
//       context,
//       title: 'Logout',
//       content: 'Are you sure that you want to logout?',
//       cancelActionText: 'Cancel',
//       defaultActionText: 'Logout',
//     );
//     if (didRequestSignOut == true) {
//       _signOut(context);
//     }
//   }
//
//   Future<void> _delete(BuildContext context, Post post) async {
//     try {
//       final database = Provider.of<Database>(context, listen: false);
//       await database.deletePost(post);
//     } on FirebaseException catch (e) {
//       showExceptionAlertDialog(
//         context,
//         title: 'Operation failed',
//         exception: e,
//       );
//     }
//   }
// }
//
// class _CommunityState extends ViewState<Community, CommunityController> {
//   _CommunityState(CommunityController controller) : super(controller);
//
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget get view => ControlledWidgetBuilder<CommunityController>(
//         builder: (context, controller) {
// return Scaffold(
//     key: scaffoldKey,
//
//     //body: SingleChildScrollView(
//     body: Container(
//         //child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//         ),
//         height: MediaQuery.of(context).size.height * 0.9,
//         child: Column(
//           //crossAxisAlignment: CrossAxisAlignment.center,
//           //mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//                 margin: EdgeInsets.all(10),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 height: MediaQuery.of(context).size.height * 0.6,
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(
//                       height: 15,
//                     ),
//                     // _boardBox,
//                   ],
//                 )),
//           ],
//         ),
//     ),
// );
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Posts'),
//               actions: <Widget>[
//                 FlatButton(
//                   child: Text(
//                     'Logout',
//                     style: TextStyle(fontSize: 18.0, color: Colors.white),
//                   ),
//                   onPressed: () => _confirmSignOut(context),
//                 )
//               ],
//             ),
//             body: _buildContents(context),
//             floatingActionButton: FloatingActionButton(
//               child: Icon(Icons.add),
//               onPressed: () => BoardView.show(context),
//             ),
//           );
//         },
//       );
//
//   Widget _buildContents(BuildContext context) {
//     final database = Provider.of<Database>(context, listen: false);
//     return StreamBuilder<List<Post>>(
//       stream: database.postsStream(),
//       builder: (context, snapshot) {
//         return ListItemsBuilder<Post>(
//           snapshot: snapshot,
//           itemBuilder: (context, post) => Dismissible(
//             key: Key('post-${post.postId}'),
//             background: Container(
//               color: Colors.grey[700],
//             ),
//             direction: DismissDirection.endToStart,
//             onDismissed: (direction) => _delete(context, post),
//             child: PostListTile(
//               post: post,
//               onTap: () => BoardView.show(context, post: post),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// internetChecker() async {
//   bool result = await InternetConnectionChecker().hasConnection;
//   if (result == false) {
//     showInSnackBar('No Internet Connecton');
//   }
// }

// Widget get _boardBox =>
//   ControlledWidgetBuilder<CommunityController>(builder: (context, controller){
//     return Column(
//       children: <Widget>[
//         Divider(thickness: 1, color: Colors.grey[300]),
//         _Board("자유게시판", "Free Board", 0, controller, context),
//         Divider(thickness: 1,color: Colors.grey[300],),
//         _Board("게시판1", "Board1", 1, controller, context),
//         Divider(thickness: 1,color: Colors.grey[300],),
//         _Board("게시판2", "Board2", 2, controller, context),
//         Divider(thickness: 1,color: Colors.grey[300],),
//         _Board("게시판3", "Board3", 3, controller, context),
//         Divider(thickness: 1,color: Colors.grey[300],),
//
//       ]
//     );
//   });

// Widget _Board(String korTitle, String engTitle, int boardOption, CommunityController controller, BuildContext context){
//   return InkWell(
//       onTap: (){
//         controller.onBoardClicked(boardOption, context);
//       },
//       child: Container(
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.symmetric(vertical: 10),
//
//           alignment: Alignment.centerLeft,
//           child: Row(
//             children: <Widget>[
//               Icon(Icons.dashboard_outlined),
//               SizedBox(width: 10,),
//               Text(korTitle,
//                   style: TextStyle(fontSize: 23,)),
//               SizedBox(width: 10),
//               Text(engTitle,
//                 style: TextStyle(fontSize: 15, color: Colors.grey),)
//             ],
//           )
//       )
//   );
// }

// void showInSnackBar(String value) {
//   scaffoldKey.currentState.removeCurrentSnackBar();
//   //globalKey.currentState.removeCurrentSnackBar();
//   scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
// }

class CommunityView extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      //because this class is a stateless widget, then the context is only available inside the build method
      //so parameter(BuildContext context) add.
      final auth = Provider.of<UsersRepository>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    //this can return true, false or null(system back button)
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  Future<void> _delete(BuildContext context, Post post) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.deletePost(post);
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: e,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            onPressed: () => _confirmSignOut(context),
          )
        ],
      ),
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => BoardView.show(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Post>>(
      stream: database.postsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Post>(
          snapshot: snapshot,
          itemBuilder: (context, post) => Dismissible(
            key: Key('post-${post.postId}'),
            background: Container(
              color: Colors.grey[700],
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => _delete(context, post),
            child: PostListTile(
              post: post,
              onTap: () => BoardView.show(context, post: post),
            ),
          ),
        );
      },
    );
  }
}

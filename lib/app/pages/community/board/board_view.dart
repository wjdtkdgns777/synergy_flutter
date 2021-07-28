import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/community/post/post_view.dart';
import 'package:synergy_flutter/data/utils/firebase.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';
import 'board_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:synergy_flutter/app/components/list_items_builder.dart';
import 'package:synergy_flutter/app/components/post_list_tile.dart';
import 'package:synergy_flutter/app/components/show_alert_dialog.dart';
import 'package:synergy_flutter/app/components/show_exception_alert_dialog.dart';
import 'package:synergy_flutter/data/models/post.dart';
import 'package:synergy_flutter/data/utils/database.dart';

// class BoardView extends View {
//   @override
//   _BoardViewState createState() => _BoardViewState(BoardController());
// }
//
// class _BoardViewState extends ViewState<BoardView, BoardController> {
//   _BoardViewState(BoardController controller) : super(controller);
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
//
//   @override
//   Widget get view => Scaffold(
//         appBar: AppBar(
//           title: Text('Jobs'),
//           actions: <Widget>[
//             FlatButton(
//               child: Text(
//                 'Logout',
//                 style: TextStyle(fontSize: 18.0, color: Colors.white),
//               ),
//               onPressed: () => _confirmSignOut(context),
//             )
//           ],
//         ),
//         body: _buildContents(context),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () => PostView.show(context),
//         ),
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
//               onTap: () => PostView.show(context, post: post),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// @override
// Widget get view => Scaffold(
//     key: globalKey,
//     body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 230,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Color(0xfff0f0f0),
//                 ),
//                 child: Text(
//                   "Board Page",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//
//                   ],
//                 ),
//               ),
//         ));

// class BoardView extends StatelessWidget {
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
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Jobs'),
//         actions: <Widget>[
//           FlatButton(
//             child: Text(
//               'Logout',
//               style: TextStyle(fontSize: 18.0, color: Colors.white),
//             ),
//             onPressed: () => _confirmSignOut(context),
//           )
//         ],
//       ),
//       body: _buildContents(context),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => PostView.show(context),
//       ),
//     );
//   }
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
//               onTap: () => PostView.show(context, post: post),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class BoardView extends StatefulWidget {
  const BoardView({Key key, @required this.database, this.post})
      : super(key: key);

  final Database database;
  final Post post;

  //this is the context of the jobs page
  //because this method called from inside the jobs page
  //as a result we can get the provider of database with this context(jobs page)
  static Future<void> show(BuildContext context, {Post post}) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        //pass the database object that actually from the jobs page into the constructor of the add job page class
        builder: (context) => BoardView(database: database, post: post),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _BoardViewState createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  final _formKey = GlobalKey<FormState>();

  String _title;
  String _content;

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _title = widget.post.title;
      _content = widget.post.content;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      try {
        //enforce unique job name
        //get the first(most up-to-date) value on the stream
        final jobs = await widget.database.postsStream().first;
        //don't forget to add toList();
        print(jobs);
        final allNames = jobs.map((job) => job.title).toList();
        //need when editing
        if (widget.post != null) {
          allNames.remove(widget.post.title);
        }
        if (allNames.contains(_title)) {
          showAlertDialog(
            context,
            title: 'Title already used',
            content: 'Please choose a different title name',
            defaultActionText: 'OK',
          );
        } else {
          final postId = widget.post?.postId ?? documentIdFromCurrentDate();
          final uid = firebaseAuth.currentUser.uid;
          final post =
              Post(postId: postId, uid: uid, title: _title, content: _content);
          await widget.database.setPost(post);
          Navigator.of(context).pop();
        }
      } on FirebaseException catch (e) {
        showExceptionAlertDialog(
          context,
          title: 'Operation failed',
          exception: e,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.post == null ? '글 쓰기' : '글 편집'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              '완료',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: _submit,
          )
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: '제목'),
        initialValue: _title,
        validator: (value) => value.isNotEmpty ? null : 'Title can\'t be empty',
        onSaved: (value) => _title = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: '내용'),
        //initialValue: _content != null ? '$_content' : null,
        initialValue: _content,
        validator: (value) =>
            value.isNotEmpty ? null : 'Content can\'t be empty',
        onSaved: (value) => _content = value,
      ),
    ];
  }
}

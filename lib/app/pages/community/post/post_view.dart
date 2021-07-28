import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:provider/provider.dart';
import 'package:synergy_flutter/app/components/show_alert_dialog.dart';
import 'package:synergy_flutter/app/components/show_exception_alert_dialog.dart';
import 'package:synergy_flutter/app/pages/community/post/post_controller.dart';
import 'package:synergy_flutter/data/models/post.dart';
import 'package:synergy_flutter/data/utils/database.dart';
import 'package:synergy_flutter/data/utils/firebase.dart';

/*
-post: null when creating a new post
-post: post(not null) when editing a post
 */

// class PostView extends View {
//   const PostView({Key key, @required this.database, this.post})
//       : super(key: key);
//
//   final Database database;
//   final Post post;
//
//   //this is the context of the jobs page
//   //because this method called from inside the jobs page
//   //as a result we can get the provider of database with this context(jobs page)
//   static Future<void> show(BuildContext context, {Post post}) async {
//     final database = Provider.of<Database>(context, listen: false);
//     await Navigator.of(context).push(
//       MaterialPageRoute(
//         //pass the database object that actually from the jobs page into the constructor of the add job page class
//         builder: (context) => PostView(database: database, post: post),
//         fullscreenDialog: true,
//       ),
//     );
//   }
//
//   @override
//   _PostViewState createState() => _PostViewState(PostController());
// }
//
// class _PostViewState extends ViewState<PostView, PostController> {
//   _PostViewState(PostController controller) : super(controller);
//
//   String _title;
//   String _content;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.post != null) {
//       _title = widget.post.title;
//       _content = widget.post.content;
//     }
//   }
//
//   bool _validateAndSaveForm() {
//     final form = _formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }
//
//   Future<void> _submit() async {
//     if (_validateAndSaveForm()) {
//       try {
//         //enforce unique job name
//         //get the first(most up-to-date) value on the stream
//         final jobs = await widget.database.postsStream().first;
//         //don't forget to add toList();
//         print(jobs);
//         final allNames = jobs.map((job) => job.title).toList();
//         //need when editing
//         if (widget.post != null) {
//           allNames.remove(widget.post.title);
//         }
//         if (allNames.contains(_title)) {
//           showAlertDialog(
//             context,
//             title: 'Name already used',
//             content: 'Please choose a different job name',
//             defaultActionText: 'OK',
//           );
//         } else {
//           final postId = widget.post?.postId ?? documentIdFromCurrentDate();
//           final uid = firebaseAuth.currentUser.uid;
//           final post =
//               Post(postId: postId, uid: uid, title: _title, content: _content);
//           await widget.database.setPost(post);
//           Navigator.of(context).pop();
//         }
//       } on FirebaseException catch (e) {
//         showExceptionAlertDialog(
//           context,
//           title: 'Operation failed',
//           exception: e,
//         );
//       }
//     }
//   }
//
//   @override
//   Widget get view => Scaffold(
//         appBar: AppBar(
//           elevation: 2.0,
//           title: Text(widget.post == null ? 'New Post' : 'Edit Post'),
//           actions: <Widget>[
//             FlatButton(
//               child: Text(
//                 'Save',
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//               onPressed: _submit,
//             )
//           ],
//         ),
//         body: _buildContents(),
//         backgroundColor: Colors.grey[200],
//       );
//
//   Widget _buildContents() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: _buildForm(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: _buildFormChildren(),
//       ),
//     );
//   }
//
//   List<Widget> _buildFormChildren() {
//     return [
//       TextFormField(
//         decoration: InputDecoration(labelText: 'post title'),
//         initialValue: _title,
//         validator: (value) => value.isNotEmpty ? null : 'Title can\'t be empty',
//         onSaved: (value) => _title = value,
//       ),
//       TextFormField(
//         decoration: InputDecoration(labelText: 'Rate per hour'),
//         //initialValue: _content != null ? '$_content' : null,
//         initialValue: _content,
//         validator: (value) =>
//             value.isNotEmpty ? null : 'Content can\'t be empty',
//         onSaved: (value) => _title = value,
//       ),
//     ];
//   }
// }

// class PostView extends StatefulWidget {
//   const PostView({Key key, @required this.database, this.post})
//       : super(key: key);
//
//   final Database database;
//   final Post post;
//
//   //this is the context of the jobs page
//   //because this method called from inside the jobs page
//   //as a result we can get the provider of database with this context(jobs page)
//   static Future<void> show(BuildContext context, {Post post}) async {
//     final database = Provider.of<Database>(context, listen: false);
//     await Navigator.of(context).push(
//       MaterialPageRoute(
//         //pass the database object that actually from the jobs page into the constructor of the add job page class
//         builder: (context) => PostView(database: database, post: post),
//         fullscreenDialog: true,
//       ),
//     );
//   }
//
//   @override
//   _PostViewState createState() => _PostViewState();
// }
//
// class _PostViewState extends State<PostView> {
//   final _formKey = GlobalKey<FormState>();
//
//   String _title;
//   String _content;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.post != null) {
//       _title = widget.post.title;
//       _content = widget.post.content;
//     }
//   }
//
//   bool _validateAndSaveForm() {
//     final form = _formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }
//
//   Future<void> _submit() async {
//     if (_validateAndSaveForm()) {
//       try {
//         //enforce unique job name
//         //get the first(most up-to-date) value on the stream
//         final jobs = await widget.database.postsStream().first;
//         //don't forget to add toList();
//         print(jobs);
//         final allNames = jobs.map((job) => job.title).toList();
//         //need when editing
//         if (widget.post != null) {
//           allNames.remove(widget.post.title);
//         }
//         if (allNames.contains(_title)) {
//           showAlertDialog(
//             context,
//             title: 'Title already used',
//             content: 'Please choose a different title name',
//             defaultActionText: 'OK',
//           );
//         } else {
//           final postId = widget.post?.postId ?? documentIdFromCurrentDate();
//           final uid = firebaseAuth.currentUser.uid;
//           final post =
//               Post(postId: postId, uid: uid, title: _title, content: _content);
//           await widget.database.setPost(post);
//           Navigator.of(context).pop();
//         }
//       } on FirebaseException catch (e) {
//         showExceptionAlertDialog(
//           context,
//           title: 'Operation failed',
//           exception: e,
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2.0,
//         title: Text(widget.post == null ? 'New Post' : 'Edit Post'),
//         actions: <Widget>[
//           FlatButton(
//             child: Text(
//               'Save',
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//             onPressed: _submit,
//           )
//         ],
//       ),
//       body: _buildContents(),
//       backgroundColor: Colors.grey[200],
//     );
//   }
//
//   Widget _buildContents() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: _buildForm(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: _buildFormChildren(),
//       ),
//     );
//   }
//
//   List<Widget> _buildFormChildren() {
//     return [
//       TextFormField(
//         decoration: InputDecoration(labelText: 'title'),
//         initialValue: _title,
//         validator: (value) => value.isNotEmpty ? null : 'Title can\'t be empty',
//         onSaved: (value) => _title = value,
//       ),
//       TextFormField(
//         decoration: InputDecoration(labelText: 'content'),
//         //initialValue: _content != null ? '$_content' : null,
//         initialValue: _content,
//         validator: (value) =>
//             value.isNotEmpty ? null : 'Content can\'t be empty',
//         onSaved: (value) => _title = value,
//       ),
//     ];
//   }
// }

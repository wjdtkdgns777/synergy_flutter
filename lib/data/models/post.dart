import 'package:flutter/cupertino.dart';

//we can only update a job if we know its documentID
class Post {
  Post(
      {@required this.postId,
      @required this.uid,
      @required this.title,
      @required this.content});
  final String postId;
  final String uid;
  final String title;
  final String content;

  factory Post.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String title = data['title'];
    final String content = data['content'];
    return Post(
      postId: documentId,
      title: title,
      content: content,
    );
  }

  //ID를 넣어주면 ID도 key value 의 형태로 들어감
  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'uid': uid,
      'title': title,
      'content': content,
    };
  }
}

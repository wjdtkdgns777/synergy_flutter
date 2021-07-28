import 'package:flutter/cupertino.dart';

//we can only update a job if we know its documentID
class Post {
  Post({@required this.id, @required this.title, @required this.content});
  final String id;
  final String title;
  // final int content;
  final String content;

  factory Post.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String title = data['name'];
    // final int ratePerHour = data['ratePerHour'];
    final String content = data['content'];
    return Post(
      id: documentId,
      title: title,
      content: content,
    );
  }

  //ID를 넣어주면 ID도 key value 의 형태로 들어감
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
    };
  }
}

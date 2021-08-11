// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class PostModel {
//   String id;
//   String postId;
//   String ownerId;
//   String username;
//   String location;
//   String title;
//   String description;
//   String mediaUrl;
//   // dynamic likesCount;
//   // dynamic likes;
//   Timestamp timestamp;
//
//
//   PostModel({
//     this.id,
//     this.postId,
//     this.ownerId,
//     this.location,
//     this.title,
//     this.description,
//     this.mediaUrl,
//     // this.likesCount,
//     // this.likes,
//     this.username,
//     this.timestamp,
//   });
//   PostModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     postId = json['postId'];
//     ownerId = json['ownerId'];
//     location = json['location'];
//     username= json['username'];
//     title = json['title'];
//     description = json['description'];
//     mediaUrl = json['mediaUrl'];
//     // likesCount = json['likes'].length ?? 0;
//     // likes = json['likes'];
//     timestamp = json['timestamp'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['postId'] = this.postId;
//     data['ownerId'] = this.ownerId;
//     data['location'] = this.location;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['mediaUrl'] = this.mediaUrl;
//     // data['likesCount']= this.likesCount;
//     // data['likes'] = this.likes;
//     data['timestamp'] = this.timestamp;
//     data['username'] = this.username;
//     return data;
//   }
// }
import 'package:flutter/cupertino.dart';

//we can only update a job if we know its documentID
class Post {
  Post(
      {@required this.postId,
      this.uid,
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

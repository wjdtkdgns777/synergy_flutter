//if you're likely to create multiple implements for those classes ->
//you can consider creating abstract based class
import 'package:synergy_flutter/data/models/post.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setPost(Post post);

  Future<void> deletePost(Post post);

  Stream<List<Post>> postsStream();
}

//toIso8601String -> convert daytime object to string
//we can't really use this method for editing an existing job
String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({this.uid}) : assert(uid != null);
  final String uid;

  //impossible (now it is private)
  // final _service = FirestoreService();

  //it is ensure that only one object of type FirestoreService can ever be created
  final _service = FirestoreService.instances;

  //for write (create & edit)
  @override
  Future<void> setPost(Post post) => _service.setData(
        //현재 시각을 path 로 설정하여 항상 고유한 경로에 Job을 생성
        path: APIPath.post(uid, post.postId),
        data: post.toMap(),
      );

  @override
  Future<void> deletePost(Post post) => _service.deleteData(
        path: APIPath.post(uid, post.postId),
      );

  //for read
  @override
  Stream<List<Post>> postsStream() => _service.collectionStream(
        path: APIPath.posts(uid),
        // builder: (data, documentId) => Post.fromMap(data, documentId, uid),
        builder: (data, documentId) => Post.fromMap(data, documentId),
      );
}

class APIPath {
  //for write
  // static String post(String uid, String postId) => '/users/$uid/posts/$postId';
  static String post(String uid, String postId) => '/posts/$postId';

  //for read
  // static String posts(String uid) => '/users/$uid/posts';
  static String posts(String uid) => '/posts';
}

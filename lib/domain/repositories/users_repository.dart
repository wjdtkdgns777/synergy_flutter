import 'package:firebase_auth/firebase_auth.dart';
import 'package:synergy_flutter/data/models/post.dart';
import 'dart:io';
import '../entities/user.dart';
import '../entities/loginResult.dart';

//서버와 통신을 하는 함수를 정의, 선언을 미리 해놓고 구현할때 . 으로 접근해서 써먹음
abstract class UsersRepository {
  Future<bool> loginUser(String email, String password);

  Stream<User> authStateChanges();

  Future<bool> signInWithEmailAndPassword(String email, String password);

  Future<bool> createUserWithEmailAndPassword(String email, String password);

  Future<UserCredential> signInWithGoogle();

  Future<User> signInWithFacebook();

  Future<void> signOut();

  Future<bool> submitPost(String title, String contents, List<File> files);

  Future<List<Post>> getPosts();

  Future<bool> deletePost(Post post);
}

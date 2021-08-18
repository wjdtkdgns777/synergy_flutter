import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:synergy_flutter/app/components/show_exception_alert_dialog.dart';
import 'package:synergy_flutter/data/utils/database.dart';
import 'package:synergy_flutter/data/utils/firebase.dart';
import 'package:synergy_flutter/domain/entities/post.dart';
import '../../domain/repositories/users_repository.dart';

class DataUsersRepository extends UsersRepository {
  List<User> users;

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> loginUser(String email, String password) async {
    var res = await firebaseAuth.signInWithEmailAndPassword(
      email: '$email',
      password: '$password',
    );

    if (res.user != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => _firebaseAuth.currentUser;

  @override
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    // return userCredential.user;
    if (userCredential != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    // return userCredential.user;
    if (userCredential != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<User> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();

    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<bool> submitPost(String title, String contents, List<File> files,
      BuildContext context) async {
    //final post = Post(postId : documentIdFromCurrentDate(), uid: uid, title: title, content: contents);
    //cloud Firestore에 추가해주는 작업
    try {
      final uid = firebaseAuth.currentUser.uid;
      final database = FirestoreDatabase(uid: uid);
      //enforce unique job name
      //get the first(most up-to-date) value on the stream
      final postId = documentIdFromCurrentDate();
      final post =
          Post(postId: postId, uid: uid, title: title, content: contents);
      await database.setPost(post);
      Navigator.of(context).pop();
      return true;
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: e,
      );
      return false;
    }

    // throw UnimplementedError();
  }

  @override
  Future<bool> deletePost(Post post, BuildContext context) async {
    // post 삭제
    try {
      final uid = firebaseAuth.currentUser.uid;
      final database = FirestoreDatabase(uid: uid);
      await database.deletePost(post);
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: e,
      );
    }

    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts(BuildContext context) async {
    // post 들 List 형태로 가져옴
    try {
      // final database = Provider.of<Database>(context, listen: false);
      final uid = firebaseAuth.currentUser.uid;
      final database = FirestoreDatabase(uid: uid);
      database.postsStream();
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: e,
      );
    }

    throw UnimplementedError();
  }
}

// @override
// Future<User> signInWithFacebook() async {
//   final fb = FacebookLogin();
//   final response = await fb.logIn(permissions: [
//     FacebookPermission.publicProfile,
//     FacebookPermission.email,
//     FacebookPermission.email,
//   ]);
//
//   switch (response.status) {
//     case FacebookLoginStatus.success:
//       final accessToken = response.accessToken;
//       final userCredential = await _firebaseAuth.signInWithCredential(
//         FacebookAuthProvider.credential(accessToken.token),
//       );
//       return userCredential.user;
//       // if (userCredential != null) {
//       //   return true;
//       // } else {
//       //   return false;
//       // }
//       // break;
//     case FacebookLoginStatus.cancel:
//       throw FirebaseAuthException(
//         code: 'ERROR_ABORTED_BY_USER',
//         message: 'Sign in aborted by user',
//       );
//     case FacebookLoginStatus.error:
//       throw FirebaseAuthException(
//         code: 'ERROR_FACEBOOK_LOGIN_FAILED',
//         message: response.error.developerMessage,
//       );
//     default:
//       throw UnimplementedError();
//   }
// }

//1. our sign in was successful
//2. as a result of this, a new user has been added to the onAuthStateChangedStream

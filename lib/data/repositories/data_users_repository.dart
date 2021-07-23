import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:synergy_flutter/data/utils/firebase.dart';
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
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

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


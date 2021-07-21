import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user.dart';
import '../entities/loginResult.dart';

//서버와 통신을 하는 함수를 정의, 선언을 미리 해놓고 구현할때 . 으로 접근해서 써먹음
abstract class UsersRepository {
  Future<User> getUser(String uid); //아마 User get currentUser와 같
  Future<List<User>> getAllUsers(); //아마 안쓸듯
  Future<bool> loginUser(
      String email, String password); //아마 signInWithEmailAndPassword 와 같

  User get currentUser;

  Stream<User> authStateChanges();

  // Future<User> signInWithEmailAndPassword(String email, String password);
  Future<bool> signInWithEmailAndPassword(String email, String password);

  // Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<bool> createUserWithEmailAndPassword(String email, String password);

  // Future<User> signInWithGoogle();
  Future<User> signInWithGoogle();

  // Future<User> signInWithFacebook();
  Future<User> signInWithFacebook();

  Future<void> signOut();
}

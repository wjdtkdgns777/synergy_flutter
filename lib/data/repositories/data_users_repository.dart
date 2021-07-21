//import 'dart:html';
import 'package:synergy_flutter/data/utils/firebase.dart';
import 'package:synergy_flutter/domain/entities/loginResult.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/users_repository.dart';

class DataUsersRepository extends UsersRepository {
  List<User> users;
  // sigleton
  static final DataUsersRepository _instance = DataUsersRepository._internal();
  DataUsersRepository._internal() {
    users = <User>[];
    users.addAll([
      User('test-uid', 'John Smith', 18),
      User('test-uid2', 'John Doe', 22)
    ]);
  }
  factory DataUsersRepository() => _instance;

  @override
  Future<List<User>> getAllUsers() async {
    // Here, do some heavy work lke http requests, async tasks, etc to get data
    return users;
  }

  @override
  Future<User> getUser(String uid) async {
    // Here, do some heavy work lke http requests, async tasks, etc to get data

    return users.firstWhere((user) => user.uid == uid);
  }

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
  Future<bool> signupUser(String email, String pw) async {
    
    var res = await firebaseAuth.createUserWithEmailAndPassword(
      email: '$email',
      password: '$pw',
    );

    if(res.user != null){
      return true;
    }else{
      return false;
    }

  }

  @override
  Future<bool> loginGoogleUser() {

    
  }
}


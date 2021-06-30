import '../entities/user.dart';
import '../entities/loginResult.dart';

abstract class UsersRepository {
  Future<User> getUser(String uid);
  Future<List<User>> getAllUsers();
  Future<bool> loginUser(String email,String password);

}

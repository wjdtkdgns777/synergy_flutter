import 'dart:async';


import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

class LoginUseCase extends UseCase<bool, LoginUseCaseParams> {
  UsersRepository _userRepository;
  LoginUseCase(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(LoginUseCaseParams params) async {
    final StreamController<bool> controller = StreamController();
    try {
      bool loginResult =
          await _userRepository.loginUser(params._email, params._password);

      controller.add(loginResult);
      logger.finest('Login successful.');

      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class LoginUseCaseParams {
  String _email;
  String _password;

  LoginUseCaseParams(this._email, this._password);
}

import 'dart:async';
import 'dart:developer';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

class SignupUseCase extends UseCase<bool, SignupUseCaseParams> {
  UsersRepository _userRepository;
  SignupUseCase(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(SignupUseCaseParams params) async {
    final StreamController<bool> controller = StreamController();
    try {
      bool signupResult =
          await _userRepository.signupUser(params._email, params._pw);

      controller.add(signupResult);
      logger.finest('Signup successful.');
      log("회원가입 성공");
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class SignupUseCaseParams{
  String _email;
  String _pw;

  SignupUseCaseParams(this._email, this._pw);
}
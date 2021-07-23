import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

class SignUpUseCase extends UseCase<bool, SignUpUseCaseParams> {
  UsersRepository _userRepository;
  SignUpUseCase(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(SignUpUseCaseParams params) async {
    final StreamController<bool> controller = StreamController();
    try {
      //서버 응답 결과
      bool signUpResult = await _userRepository.createUserWithEmailAndPassword(
          params._email, params._password);

      //결과를 controller에 넣어줌
      controller.add(signUpResult);
      logger.finest('SignUp successful.');

      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    //값을 리턴, observer에 들어가 결과를 파악
    return controller.stream;
  }
}

class SignUpUseCaseParams {
  String _email;
  String _password;

  SignUpUseCaseParams(this._email, this._password);
}

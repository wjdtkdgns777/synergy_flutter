import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';


class GoogleLoginUseCase extends UseCase<UserCredential,GoogleLoginUseCaseParams> {
  UsersRepository _userRepository;
  GoogleLoginUseCase(this._userRepository);

  @override
  Future<Stream<UserCredential>> buildUseCaseStream(GoogleLoginUseCaseParams params) async {
    final StreamController<UserCredential> controller = StreamController();
    try {
      //서버 응답 결과
      UserCredential signUpResult = await _userRepository.signInWithGoogle();
      //결과를 controller 에 넣어줌
      controller.add(signUpResult);
      logger.finest('SignUp successful.');

      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    //값을 리턴, observer 에 들어가 결과를 파악
    return controller.stream;
  }
}

class GoogleLoginUseCaseParams {

  GoogleLoginUseCaseParams();
}

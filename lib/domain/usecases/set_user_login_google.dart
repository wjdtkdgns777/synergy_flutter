import 'dart:async';
import 'dart:developer';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

class LoginGoogleUseCase extends UseCase<bool, LoginGoogleUseCaseParams> {
  UsersRepository _userRepository;
  LoginGoogleUseCase(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(LoginGoogleUseCaseParams params) async {
    final StreamController<bool> controller = StreamController();
    try {
      bool loginResult =
          await _userRepository.loginGoogleUser();

      controller.add(loginResult);
      logger.finest('Login successful.');
      log("구글 로그인 성공");
      controller.close();
    } catch (e) {
      controller.addError(e);
      log("구글 로그인 실패");
    }
    return controller.stream;
  }
}

class LoginGoogleUseCaseParams {
  
  LoginGoogleUseCaseParams();
}

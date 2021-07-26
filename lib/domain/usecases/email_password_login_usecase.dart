import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

class EmailPasswordLoginUseCase extends UseCase<bool, LoginUseCaseParams> {
  UsersRepository _userRepository;
  EmailPasswordLoginUseCase(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(LoginUseCaseParams params) async {
    final StreamController<bool> controller = StreamController();
    try {
      //서버 응답 결과
      bool signUpResult = await _userRepository.loginUser(
          params._email, params._password);

      //결과를 controller에 넣어줌
      controller.add(signUpResult);
      logger.finest('SignUp successful.');

      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    //값을 리턴, oberser에 들어가 결과를 파악
    return controller.stream;
  }
}

class LoginUseCaseParams {
  String _email;
  String _password;

  LoginUseCaseParams(this._email, this._password);
}

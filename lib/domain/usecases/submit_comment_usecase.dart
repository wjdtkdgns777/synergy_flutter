import 'package:flutter/cupertino.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

class SubmitCommentUseCase extends UseCase<bool, SubmitCommentUseCaseParams> {
  UsersRepository _userRepository;
  SubmitCommentUseCase(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(SubmitCommentUseCaseParams params) async {
    final StreamController<bool> controller = StreamController();
    try {
      //서버 응답 결과
      /*
      bool signUpResult = await _userRepository.submitPost(
          params._comment);

      //결과를 controller에 넣어줌
      controller.add(signUpResult);
      logger.finest('Submit Comment successful.');*/

      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    //값을 리턴, observer에 들어가 결과를 파악
    return controller.stream;
  }
}

class SubmitCommentUseCaseParams {
  String _comment;

  SubmitCommentUseCaseParams(this._comment);
}

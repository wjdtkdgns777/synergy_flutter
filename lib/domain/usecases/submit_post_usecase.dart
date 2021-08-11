import 'package:flutter/cupertino.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';

class SubmitPostUseCase extends UseCase<bool, SubmitPostUseCaseParams> {
  UsersRepository _userRepository;
  SubmitPostUseCase(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(SubmitPostUseCaseParams params) async {
    final StreamController<bool> controller = StreamController();
    try {
      //서버 응답 결과
      bool signUpResult = await _userRepository.submitPost(
          params._title, params._contents, params._files, params._context);

      //결과를 controller에 넣어줌
      controller.add(signUpResult);
      logger.finest('Submit Post successful.');

      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    //값을 리턴, observer에 들어가 결과를 파악
    return controller.stream;
  }
}

class SubmitPostUseCaseParams {
  String _title;
  String _contents;
  List<File> _files;
  BuildContext _context;

  SubmitPostUseCaseParams(this._title, this._contents, this._files, this._context);
}

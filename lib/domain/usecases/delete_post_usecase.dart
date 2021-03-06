import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/entities/post.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';


class DeletePostUseCase extends UseCase<bool,DeletePostUseCaseParams> {
  UsersRepository _userRepository;
  DeletePostUseCase(this._userRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(DeletePostUseCaseParams params) async {
    final StreamController<bool> controller = StreamController();

    try {
      //서버 응답 결과
      bool signUpResult = await _userRepository.deletePost(params._post, params._context);
      //결과를 controller 에 넣어줌
      controller.add(signUpResult);
      logger.finest('deletion successful.');

      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    //값을 리턴, observer 에 들어가 결과를 파악
    return controller.stream;
  }
}

class DeletePostUseCaseParams {
  Post _post;
  BuildContext _context;

  DeletePostUseCaseParams(this._post, this._context);
}

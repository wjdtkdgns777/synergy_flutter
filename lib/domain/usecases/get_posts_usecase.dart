import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';
import 'package:synergy_flutter/data/models/post.dart';


class GetPostsUseCase extends UseCase<List<Post>, GetPostsUseCaseParams> {
  UsersRepository _userRepository;
  GetPostsUseCase(this._userRepository);

  @override
  Future<Stream<List<Post>>> buildUseCaseStream(GetPostsUseCaseParams params) async {
    final StreamController<List<Post>> controller = StreamController();

    try {
      //서버 응답 결과
      List<Post> getPostResult = await _userRepository.getPosts();
      //결과를 controller 에 넣어줌
      controller.add(getPostResult);
      logger.finest('SignUp successful.');

      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    //값을 리턴, observer 에 들어가 결과를 파악
    return controller.stream;
  }
}

class GetPostsUseCaseParams {


  GetPostsUseCaseParams();
}

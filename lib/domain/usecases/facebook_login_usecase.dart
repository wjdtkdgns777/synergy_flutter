import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';
//
// class FacebookLoginUseCase extends UseCase<bool, FacebookLoginUseCaseParams> {
//   UsersRepository _userRepository;
//   FacebookLoginUseCase(this._userRepository);
//
//   @override
//   Future<Stream<bool>> buildUseCaseStream(
//       FacebookLoginUseCaseParams params) async {
//     final StreamController<bool> controller = StreamController();
//     try {
//       //서버 응답 결과
//       // bool signUpResult = await _userRepository.signInWithFacebook();
//       //결과를 controller 에 넣어줌
//       controller.add(signUpResult);
//       logger.finest('SignUp successful.');
//
//       controller.close();
//     } catch (e) {
//       controller.addError(e);
//     }
//     //값을 리턴, observer 에 들어가 결과를 파악
//     return controller.stream;
//   }
// }
//
// class FacebookLoginUseCaseParams {
//   FacebookLoginUseCaseParams();
// }

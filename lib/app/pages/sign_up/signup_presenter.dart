import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:developer';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';
import 'package:synergy_flutter/domain/usecases/set_user_signup.dart';

class SignUpPresenter extends Presenter {

  SignupUseCase _signupUseCase;
  Function signupNext;
  Function signupComplete;
  Function signupError;

  SignUpPresenter(dataUserRepository)
    :_signupUseCase = SignupUseCase(dataUserRepository);


  void signup(String email, String pw){
    _signupUseCase.execute(
      _SignUpObserver(this), SignupUseCaseParams(email, pw));
  }

  void dispose() {}
}

class _SignUpObserver implements Observer<bool> {
  SignUpPresenter _signUpPresenter;
  _SignUpObserver(this._signUpPresenter);


  void onNext(result) {
    assert(_signUpPresenter.signupNext != null);
    _signUpPresenter.signupNext(result);

  }

  void onComplete() {
    assert(_signUpPresenter.signupComplete != null);
    _signUpPresenter.signupComplete();
  }

  void onError(e) {
    assert(_signUpPresenter.signupError != null);
    _signUpPresenter.signupError(e);
  }
}

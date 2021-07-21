import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/usecases/sign_up_usecase.dart';

class SignUpPresenter extends Presenter {
  SignUpUseCase _signupUseCase;
  Function signUpNext;
  Function signUpComplete;
  Function signUpError;

  SignUpPresenter(dataUserRepository)
      : _signupUseCase = SignUpUseCase(dataUserRepository);

  void signup(String email, String pw) {
    _signupUseCase.execute(
        _SignUpObserver(this), SignUpUseCaseParams(email, pw));
  }

  void dispose() {}
}

class _SignUpObserver implements Observer<bool> {
  SignUpPresenter _signUpPresenter;
  _SignUpObserver(this._signUpPresenter);

  void onNext(result) {
    assert(_signUpPresenter.signUpNext != null);
    _signUpPresenter.signUpNext(result);
  }

  void onComplete() {
    assert(_signUpPresenter.signUpComplete != null);
    _signUpPresenter.signUpComplete();
  }

  void onError(e) {
    assert(_signUpPresenter.signUpError != null);
    _signUpPresenter.signUpError(e);
  }
}

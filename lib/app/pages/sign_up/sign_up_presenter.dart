import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/usecases/sign_up_usecase.dart';

class SignUpPresenter extends Presenter {
  SignUpUseCase _signUpUseCase;
  Function signUpNext;
  Function signUpComplete;
  Function signUpError;

  SignUpPresenter(dataUserRepository)
      : _signUpUseCase = SignUpUseCase(dataUserRepository);

  void signUp(String email, String pw) {
    _signUpUseCase.execute(
        _SignUpObserver(this), SignUpUseCaseParams(email, pw));
  }

  void dispose() {
    _signUpUseCase.dispose();
  }
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

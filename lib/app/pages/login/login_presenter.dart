import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';
import 'package:synergy_flutter/domain/usecases/set_user_login.dart';

class LoginPresenter extends Presenter {
  LoginUseCase _loginUseCase;
  Function loginNext;
  Function loginComplete;
  Function loginError;

  LoginPresenter(_usersRepository)
      : _loginUseCase = LoginUseCase(_usersRepository);

  void login(String email, String password) {
    _loginUseCase.execute(
        _LoginObserver(this), LoginUseCaseParams(email, password));
  }

  void dispose() {
    _loginUseCase.dispose();
  }
}

class _LoginObserver implements Observer<bool> {
  LoginPresenter _loginPresenter;

  _LoginObserver(this._loginPresenter);

  void onNext(result) {
    assert(_loginPresenter.loginNext != null);
    _loginPresenter.loginNext(result);
  }

  void onComplete() {
    assert(_loginPresenter.loginComplete != null);
    _loginPresenter.loginComplete();
  }

  void onError(e) {
    assert(_loginPresenter.loginError != null);
    _loginPresenter.loginError(e);
  }
}

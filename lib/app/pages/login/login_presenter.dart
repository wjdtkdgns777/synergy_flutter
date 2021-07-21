import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';
import 'package:synergy_flutter/domain/usecases/email_password_login_usecase.dart';
import 'package:synergy_flutter/domain/usecases/facebook_login_usecase.dart';
import 'package:synergy_flutter/domain/usecases/google_login_usecase.dart';
import 'package:synergy_flutter/domain/usecases/sign_up_usecase.dart';

//네트워크 연결
class LoginPresenter extends Presenter {
  EmailPasswordLoginUseCase _emailPasswordLoginUseCase;
  // GoogleLoginUseCase _googleLoginUseCase;
  // FacebookLoginUseCase _facebookLoginUseCase;
  Function loginNext;
  Function loginComplete;
  Function loginError;

  LoginPresenter(_usersRepository)
      : _emailPasswordLoginUseCase =
            EmailPasswordLoginUseCase(_usersRepository);

  //서버와 직접적인 통신
  void emailPasswordLogin(String email, String password) {
    //observer로 확인 후 loginUseCaseParams을 통해 어디로 보내겠다
    _emailPasswordLoginUseCase.execute(
        _LoginObserver(this), LoginUseCaseParams(email, password));
  }

  // void googleLogin() {
  //   _googleLoginUseCase.execute(
  //       _LoginObserver(this), GoogleLoginUseCaseParams());
  // }
  //
  // void facebookLogin() {
  //   _facebookLoginUseCase.execute(
  //       _LoginObserver(this), FacebookLoginUseCaseParams());
  // }

  void dispose() {
    _emailPasswordLoginUseCase.dispose();
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

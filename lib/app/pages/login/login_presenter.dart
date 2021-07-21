import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/domain/repositories/users_repository.dart';
import 'package:synergy_flutter/domain/usecases/set_user_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:synergy_flutter/domain/usecases/set_user_login_google.dart';

class LoginPresenter extends Presenter {
  LoginUseCase _loginUseCase;
  LoginGoogleUseCase _loginGoogleUseCase;
  Function loginNext;
  Function loginComplete;
  Function loginError;

  LoginPresenter(_usersRepository)
      : _loginUseCase = LoginUseCase(_usersRepository);

  void login(String email, String password) {
    _loginUseCase.execute(
        _LoginObserver(this), LoginUseCaseParams(email, password));
  }

  void loginWithGoogle(){
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);
    GoogleSignInAccount _currentUser;
    
    _loginGoogleUseCase.execute(
      _LoginObserver(this), LoginGoogleUseCaseParams()
    );
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


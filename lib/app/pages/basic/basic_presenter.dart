import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPresenter extends Presenter {
  Function loginOnComplete; // alternatively `void loginOnComplete();`
  Function loginOnError;
  Function loginOnNext; // not needed in the case of a login presenter

  /// login function called by the controller


  /// Disposes of the [LoginUseCase] and unsubscribes
  @override
  void dispose() {

  }
}

/// The [Observer] used to observe the `Stream` of the [LoginUseCase]
class _LoginUseCaseObserver implements Observer<void> {
  // The above presenter
  // This is not optimal, but it is a workaround due to dart limitations. Dart does
  // not support inner classes or anonymous classes.
  final LoginPresenter loginPresenter;

  _LoginUseCaseObserver(this.loginPresenter);

  /// implement if the `Stream` emits a value
  // in this case, unnecessary
  void onNext(_) {}

  /// Login is successful, trigger event in [LoginController]
  void onComplete() {
    // any cleaning or preparation goes here
    assert(loginPresenter.loginOnComplete != null);
    loginPresenter.loginOnComplete();
  }

  /// Login was unsuccessful, trigger event in [LoginController]
  void onError(e) {
    // any cleaning or preparation goes here
    assert(loginPresenter.loginOnError != null);
    loginPresenter.loginOnError(e);
  }
}

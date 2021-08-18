import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'dart:io';
import 'package:synergy_flutter/domain/usecases/submit_post_usecase.dart';

class AddPostPresenter extends Presenter {
  SubmitPostUseCase _submitPostUseCase;
  Function addPostNext;
  Function addPostComplete;
  Function addPostError;

  AddPostPresenter(dataUserRepository)
    : _submitPostUseCase = SubmitPostUseCase(dataUserRepository);

  void submitPost(String title, String content, List<File> files, BuildContext context){
    _submitPostUseCase.execute(
        _AddPostObserver(this), SubmitPostUseCaseParams(title, content, files, context));
  }

  void dispose() {
  }
}

class _AddPostObserver implements Observer<bool> {
  AddPostPresenter _addPostPresenter;

  _AddPostObserver(this._addPostPresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

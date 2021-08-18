import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/data/repositories/data_users_repository.dart';
import 'package:synergy_flutter/domain/entities/post.dart';
import 'package:synergy_flutter/domain/usecases/get_posts_usecase.dart';
import 'package:synergy_flutter/domain/usecases/delete_post_usecase.dart';

class BoardPresenter extends Presenter {
  DataUsersRepository _dataUsersRepository;
  GetPostsUseCase _getPostsUseCase;
  DeletePostUseCase _deletePostUseCase;
  Function boardNext;
  Function boardComplete;
  Function boardError;

  BoardPresenter(dataUserRepository)
    :_dataUsersRepository = dataUserRepository;


  List<Post> getPosts(){

  }

  void deletePost(Post post){

  }

  void dispose() {
  }
}

class _GetPostsObserver implements Observer<List<Post>> {
  BoardPresenter _boardPresenter;

  _GetPostsObserver(this._boardPresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

class _DeletePostObserver implements Observer<bool> {
  BoardPresenter _boardPresenter;

  _DeletePostObserver(this._boardPresenter);

  void onNext(result) {
  }

  void onComplete() {
  }

  void onError(e) {
  }
}

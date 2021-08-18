import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'post_controller.dart';
import 'package:synergy_flutter/data/repositories/data_users_repository.dart';
import 'package:synergy_flutter/domain/entities/post.dart';

class PostView extends View {

  final Post post;

  PostView(post)
    :post = post;

  @override
  _PostViewState createState() => _PostViewState(PostController(DataUsersRepository()), post);
}

class _PostViewState extends ViewState<PostView, PostController> {
  _PostViewState(PostController controller, Post post) : p_post = post, super(controller);

  final Post p_post;

  @override
  Widget get view => Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(
          'Post',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              //수정, 삭제, 즐겨찾기 등등
            },
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _mainContent,
                    _comment,
                  ],
                ),
              ),
            ],
          ),
        ),
      ));


  Widget get _mainContent =>
      ControlledWidgetBuilder<PostController>(builder: (context, controller) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                p_post.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              //글쓴이(사진), 날짜
              Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.black,
                            ),
                            SizedBox(width: 5,),
                            Text("글쓴이")
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("2021.8.11 18:50"),
                    )
                  ],
                ),
              ),
              Divider(),
              //내용
              Container(
                margin: EdgeInsets.all(10),
                child: ConstrainedBox(

                  constraints: BoxConstraints(
                    minHeight: 100,
                  ),
                  child: Text(
                    p_post.content,
                  ),
                ),
              ),

              SizedBox(height: 20,)
            ],
          ),
        );

      });

  Widget get _comment =>
      ControlledWidgetBuilder<PostController>(builder: (context, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.all(Radius.circular(20))
                ),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(left: 15),
                          width: MediaQuery.of(context).size.width - 115,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "댓글을 입력해주세요"
                              ),
                            ),
                          )

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: (){
                          controller.onClickCommentBtn();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 60,
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.black,
                            ),
                            SizedBox(width: 5,),
                            Text("댓글러"),
                            //VerticalDivider(color: Colors.black,),
                            SizedBox(width: 20,),
                            Text("댓글1"),
                          ],
                        )
                    ),


                  ],
                ),
              ),
              Divider(),
              Container(
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(width: 5,),
                      Text("댓글러"),
                      //VerticalDivider(color: Colors.black,),
                      SizedBox(width: 20,),
                      Text("댓글2"),
                    ],
                  )
              ),
              Divider(),
              Container(
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(width: 5,),
                      Text("댓글러"),
                      //VerticalDivider(color: Colors.black,),
                      SizedBox(width: 20,),
                      Text("댓글3"),
                    ],
                  )
              ),
              Divider(),
              Container(
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(width: 5,),
                      Text("댓글러"),
                      //VerticalDivider(color: Colors.black,),
                      SizedBox(width: 20,),
                      Text("댓글4"),
                    ],
                  )
              ),
            ],
          ),
        );

      });

}

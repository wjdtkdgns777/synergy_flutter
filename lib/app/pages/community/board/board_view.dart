import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'board_controller.dart';
import 'dart:developer';
import 'package:synergy_flutter/domain/entities/post.dart';
import 'package:synergy_flutter/app/pages/community/addpost/addpost_view.dart';


class BoardView extends View {
  @override
  _BoardViewState createState() => _BoardViewState(BoardController());
}

class _BoardViewState extends ViewState<BoardView, BoardController> {
  _BoardViewState(BoardController controller) : super(controller);

  @override
  Widget get view => Scaffold(
      key: globalKey,
      appBar: AppBar(
      title: Text(
      'Board',
      style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon : Icon(Icons.add),
          onPressed: (){
            Navigator.push(
              context,
                MaterialPageRoute(builder: (context) => AddPostView())
            );
          },
        ),
      ],
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),),
      body: _postList
  );

  internetChecker() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      showInSnackBar('No Internet Connecton', context);
    }
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  Widget get _postList =>
      ControlledWidgetBuilder<BoardController>(builder: (context, controller){
        return Container(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: controller.future,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator(),);
                case ConnectionState.done:
                  if(snapshot.hasError){
                    Text("Error Occurred : ${snapshot.hasError.toString()}");
                  }else if(snapshot.data != null){
                    controller.isLoading = false;
                    controller.pageNum++;

                    return Scrollbar(
                      child: ListView.separated(
                        itemCount: controller.posts == null? 0 : controller.posts.length,
                        controller: controller.scrollController,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index){
                          return Column(
                            children: <Widget>[
                              ListTile(
                                title: Text('$index ${controller.posts[index]['title']}'),
                              ),
                              Container(
                                color: Colors.black,
                                height: (index == controller.posts.length-1 && controller.totalRecord > controller.posts.length) ? 50 : 0,
                                width: MediaQuery.of(context).size.width,
                                child:Center(
                                    child: CircularProgressIndicator()
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );

                  }else{
                    log("Data 없음");

                    return Center(child: Text("No data"),);
                  }
              }
            }
          ),
        );

      });


}

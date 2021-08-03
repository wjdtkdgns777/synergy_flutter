import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/data/repositories/data_users_repository.dart';
import 'addpost_controller.dart';
import 'package:synergy_flutter/domain/entities/post.dart';

class AddPostView extends View {
  @override
  _AddPostViewState createState() => _AddPostViewState(AddPostController(DataUsersRepository()));
}

class _AddPostViewState extends ViewState<AddPostView, AddPostController> {
  _AddPostViewState(AddPostController controller) : super(controller);

  @override
  Widget get view => Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(
          'Create New Posts',
          style: TextStyle(color: Colors.black),
        ),

        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xfff0f0f0),
                ),
                child: Column(
                  children: <Widget>[
                    _titleBox,
                    SizedBox(height: 10,),
                    _contentBox,
                    SizedBox(height: 10,),
                    _fileButton,
                    _attachedFile,
                    _submitButton,
                  ],
                ),
              ),

            ],
          ),
        ),
      ));
}

Widget get _titleBox =>
    ControlledWidgetBuilder<AddPostController>(builder: (context, controller){
      return TextField(
        style: TextStyle(height: 0.7, fontSize: 20.0),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '제목',
          filled: true,
          fillColor: Colors.white,
        ),
        cursorHeight: 20.0,
        controller: controller.titleController,
      );
    });


Widget get _contentBox =>
    ControlledWidgetBuilder<AddPostController>(builder: (context, controller){
      return Container(
        height: 300,
        child: TextFormField(
          //style: TextStyle(height: 5.0, fontSize : 18.0),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.only(top:300),
            filled: true,
            fillColor: Colors.white,
          ),
          validator: (value) => value.isNotEmpty ? null : 'Title can\'t be empty',
          controller: controller.contentController,
        ),
      );
    });


Widget get _fileButton =>
    ControlledWidgetBuilder<AddPostController>(builder: (context, controller){
      return Container(
        //color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
                child:ElevatedButton.icon(
                  onPressed: (){
                    controller.selectFile();
                  },
                  icon: Icon(Icons.folder_open),
                  label: Text("파일 첨부"),
                )
            ),

          ],
        ),
      );
    });

Widget get _attachedFile =>
    ControlledWidgetBuilder<AddPostController>(builder: (context, controller){
      return Container(
        child:Align(
          alignment: Alignment.centerLeft,
          child: Text(controller.selectedFileList,
          ),
        )
      );
    });

Widget get _submitButton =>
    ControlledWidgetBuilder<AddPostController>(builder: (context, controller){
      return Container(
        child: ElevatedButton.icon(
          onPressed: (){
            controller.onClickSubmit();
          },
          icon: Icon(Icons.arrow_forward_ios),
          label: Text("Submit"),
        ),
      );
    });
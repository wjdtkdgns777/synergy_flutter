import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'addpost_controller.dart';

class AddPostView extends View {
  @override
  _AddPostViewState createState() => _AddPostViewState(AddPostController());
}

class _AddPostViewState extends ViewState<AddPostView, AddPostController> {
  _AddPostViewState(AddPostController controller) : super(controller);

  @override
  Widget get view => Scaffold(
      key: globalKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xfff0f0f0),
                ),
                child: Text(
                  "Add post page",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),

            ],
          ),
        ),
      ));
}

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'board_controller.dart';

class BoardView extends View {
  @override
  _BoardViewState createState() => _BoardViewState(BoardController());
}

class _BoardViewState extends ViewState<BoardView, BoardController> {
  _BoardViewState(BoardController controller) : super(controller);

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
                    "Board Page",
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

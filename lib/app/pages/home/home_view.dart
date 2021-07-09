import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/components/movieTile.dart';

import 'home_controller.dart';

class HomePage extends View {
  @override
  _HomePageState createState() => _HomePageState(HomeController());
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState(HomeController controller) : super(controller);

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
                "클릭시 Tutorial",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Team Up",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfff6f6f6),
                    ),
                  ),
                  SizedBox(width: 8),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "헬스 모바일 프로젝트 함께해요",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 269,
                        child: Text(
                          "He'll want to use your yacht, and I don't want this thing smelling like fish.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //      "8m ago",
                  //      textAlign: TextAlign.right,
                  //      style: TextStyle(
                  //        color: Color(0xffbdbdbd),
                  //        fontSize: 14,
                  //      ),
                  //    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfff6f6f6),
                    ),
                  ),
                  SizedBox(width: 8),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "헬스 모바일 프로젝트 함께해요",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 269,
                        child: Text(
                          "He'll want to use your yacht, and I don't want this thing smelling like fish.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //      "8m ago",
                  //      textAlign: TextAlign.right,
                  //      style: TextStyle(
                  //        color: Color(0xffbdbdbd),
                  //        fontSize: 14,
                  //      ),
                  //    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfff6f6f6),
                    ),
                  ),
                  SizedBox(width: 8),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "헬스 모바일 프로젝트 함께해요",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 269,
                        child: Text(
                          "He'll want to use your yacht, and I don't want this thing smelling like fish.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //      "8m ago",
                  //      textAlign: TextAlign.right,
                  //      style: TextStyle(
                  //        color: Color(0xffbdbdbd),
                  //        fontSize: 14,
                  //      ),
                  //    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfff6f6f6),
                    ),
                  ),
                  SizedBox(width: 8),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "헬스 모바일 프로젝트 함께해요",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 269,
                        child: Text(
                          "He'll want to use your yacht, and I don't want this thing smelling like fish.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //      "8m ago",
                  //      textAlign: TextAlign.right,
                  //      style: TextStyle(
                  //        color: Color(0xffbdbdbd),
                  //        fontSize: 14,
                  //      ),
                  //    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 73,
              child: Text(
                "더보기 >>",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Container(
                  width: 110,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 110,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 110,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 110,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange,
                  ),
                ),
              ]),
            ),
          ],
        ),
      )));
}

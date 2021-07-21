import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synergy_flutter/app/components/bezierContainer.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/sign_up_controller.dart';
import 'package:synergy_flutter/data/repositories/data_users_repository.dart';

class SignUpPage extends View {
  @override
  _SignUpPageState createState() =>
      _SignUpPageState(SignUpController(DataUsersRepository()));
}

class _SignUpPageState extends ViewState<SignUpPage, SignUpController> {
  _SignUpPageState(SignUpController controller) : super(controller);

  @override
  Widget get view => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height * .2),
                      _title,
                      SizedBox(
                        height: 50,
                      ),
                      _signUpWidget,
                      SizedBox(
                        height: 20,
                      ),
                      _submitButton,
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .14),
                      _loginAccountLabel,
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton),
            ],
          ),
        ),
      );

  Widget get _backButton =>
      ControlledWidgetBuilder<SignUpController>(builder: (context, controller) {
        return InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                  child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
                ),
                Text('Back',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        );
      });

  // Widget _entryField(String title, {bool isPassword = false}) {
  // Widget _entryField(
  //     TextEditingController myController, String labelText, String hintText,
  //     {bool isPassword = false}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         // Text(
  //         //   title,
  //         //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  //         // ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //           obscureText: isPassword,
  //           decoration: InputDecoration(
  //             // border: InputBorder.none,
  //             // fillColor: Color(0xfff3f3f4),
  //             // filled: true))
  //             labelText: labelText,
  //             hintText: hintText,
  //             focusedBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //                 borderSide: BorderSide(width: 1, color: Colors.blue)),
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //               borderSide: BorderSide(width: 1, color: Colors.black),
  //             ),
  //           ),
  //           controller: myController,
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget get _submitButton =>
      ControlledWidgetBuilder<SignUpController>(builder: (context, controller) {
        return InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xfffbb448),
                  Color(0xfff7892b),
                ],
              ),
            ),
            child: Text(
              'Register Now',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          onTap: () => controller.onClickCreateUser(),
        );
      });

  Widget get _loginAccountLabel =>
      ControlledWidgetBuilder<SignUpController>(builder: (context, controller) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account ?',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color: Color(0xfff79c4f),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        );
      });

  Widget get _title =>
      ControlledWidgetBuilder<SignUpController>(builder: (context, controller) {
        return Text(
          "Synergy",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        );
      });

  // Widget get _emailPasswordWidget =>
  //     ControlledWidgetBuilder<SignUpController>(builder: (context, controller) {
  //       return Column(
  //         children: <Widget>[
  //           _entryField(
  //               controller.usernameEditController, "Username", "닉네임을 입력하세요"),
  //           _entryField(controller.emailEditController, "Email", "이메일을 입력하세요"),
  //           _entryField(
  //               controller.passwordEditController, "Password", "비밀번호를 입력하세요",
  //               isPassword: true),
  //         ],
  //       );
  //     });
  Widget get _signUpWidget =>
      //ControlledWidgetBuilder <- 컨트룰러와 연결
      ControlledWidgetBuilder<SignUpController>(builder: (context, controller) {
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true),
                    //자동완성 없애기
                    autocorrect: false,
                    //이메일 형식 기입
                    keyboardType: TextInputType.name,
                    //키보드에 비밀번호 입력칸으로 이동하는 버튼
                    textInputAction: TextInputAction.next,
                    controller: controller.usernameController,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true),
                    //자동완성 없애기
                    autocorrect: false,
                    //이메일 형식 기입
                    keyboardType: TextInputType.emailAddress,
                    //키보드에 비밀번호 입력칸으로 이동하는 버튼
                    textInputAction: TextInputAction.next,
                    controller: controller.emailController,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true),
                    controller: controller.passwordController,
                  )
                ],
              ),
            ),
          ],
        );
      });
}

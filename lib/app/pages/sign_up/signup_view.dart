import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synergy_flutter/app/components/bezierContainer.dart';
import 'package:synergy_flutter/app/pages/login/login_view.dart';
import 'package:synergy_flutter/app/pages/sign_up/signup_controller.dart';
import 'dart:developer';


class SignUpPage extends View {
  @override
  _SignUpPageState createState() => _SignUpPageState(SignUpController());
}

class _SignUpPageState extends ViewState<SignUpPage, SignUpController> {
  _SignUpPageState(SignUpController controller) : super(controller);

  @override
  Widget get view => Scaffold(
    body: Container(
      height:  MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 35),
                  _title,
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),

                  _emailPasswordWidget,
                  SizedBox(
                    height: 20,
                  ),
                  _submitButton,
                  SizedBox(height:  MediaQuery.of(context).size.height * .14),
                  _loginAccountLabel,
                ],
              ),
            ),
          ),
          Positioned(top: 30, left: 0, child: _backButton),
        ],
      ),
    ),
  );


  Widget get _backButton =>ControlledWidgetBuilder<SignUpController>(builder: (context, controller)  {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        log('back');
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

  Widget _entryField(TextEditingController myController, String labelText, String hintText, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  labelText: labelText,
                  hintText: hintText,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.blue)
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ), 
              ),
              controller: myController,
          )
        ],
      ),
    );
  }

  Widget get _submitButton =>ControlledWidgetBuilder<SignUpController>(builder: (context, controller)  {
    
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
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
              colors: [Colors.grey, Colors.black])),
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  });

  Widget get _loginAccountLabel =>ControlledWidgetBuilder<SignUpController>(builder: (context, controller)  {
    return InkWell(
      onTap: () {
        //Navigator.push(
            //context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                  color: Colors.blue,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  });

  Widget get _title =>ControlledWidgetBuilder<SignUpController>(builder: (context, controller)  {
    return Text(
      "Sign up",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  });

  Widget get _emailPasswordWidget =>ControlledWidgetBuilder<SignUpController>(builder: (context, controller)  {
    return Column(
      children: <Widget>[
        _entryField(controller.idEditController, "ID", "ID를 입력하세요"),
        _entryField(controller.pwEditController, "Password", "비밀번호를 입력하세요", isPassword: true),
        _entryField(controller.usernameEditController, "Username", "닉네임을 입력하세요"),
        _entryField(controller.emailEditController, "Email Address", "이메일 주소를 입력하세요"),
      ],
    );
  });

}



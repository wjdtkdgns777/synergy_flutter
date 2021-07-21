import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/components/bezierContainer.dart';
import 'package:synergy_flutter/app/components/social_sign_in_button.dart';
import 'package:synergy_flutter/app/pages/login/login_controller.dart';
import 'package:synergy_flutter/app/pages/sign_up/sign_up_view.dart';
import 'package:synergy_flutter/data/repositories/data_users_repository.dart';

class LoginPage extends View {
  @override
  _LoginPageState createState() =>
      _LoginPageState(LoginController(DataUsersRepository()));
}

//GoogleLogin
Future<void> _signInWithGoogle() async {
  // <-----
  try {
    await DataUsersRepository().signInWithGoogle();
  } catch (e) {
    print(e.toString());
  }
}

Future<void> _signInWithFacebook() async {
  try {
    await DataUsersRepository().signInWithFacebook();
  } catch (e) {
    print(e.toString());
  }
}

class _LoginPageState extends ViewState<LoginPage, LoginController> {
  _LoginPageState(LoginController controller) : super(controller);

  @override
  Widget get view => Scaffold(
      key: globalKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * .2),
                    _title(),
                    SizedBox(height: 50),
                    _emailPasswordWidget,
                    SizedBox(height: 20),
                    _submitButton,
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    _divider(),
                    _googleLoginButton(),
                    SizedBox(height: 8.0),
                    _facebookLoginButton(),
                    SizedBox(height: MediaQuery.of(context).size.height * .055),
                    _createAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ));

  Widget _backButton() {
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
  }

  Widget get _submitButton =>
      ControlledWidgetBuilder<LoginController>(builder: (context, controller) {
        return GestureDetector(
          onTap: controller.onClickLogin,
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
                    colors: [Color(0xfffbb448), Color(0xfff7892b)])),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        );
      });

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  // Widget _facebookButton() =>
  //     ControlledWidgetBuilder<LoginController>(builder: (context, controller) {
  //       return InkWell(
  //         onTap: () {
  //           controller.onClickFacebookLogin();
  //         },
  //         child: Container(
  //           height: 50,
  //           margin: EdgeInsets.symmetric(vertical: 20),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.all(Radius.circular(10)),
  //           ),
  //           child: Row(
  //             children: <Widget>[
  //               Expanded(
  //                 flex: 1,
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     color: Color(0xff1959a9),
  //                     borderRadius: BorderRadius.only(
  //                         bottomLeft: Radius.circular(5),
  //                         topLeft: Radius.circular(5)),
  //                   ),
  //                   alignment: Alignment.center,
  //                   child: Text('f',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 25,
  //                           fontWeight: FontWeight.w400)),
  //                 ),
  //               ),
  //               Expanded(
  //                 flex: 5,
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     color: Color(0xff2872ba),
  //                     borderRadius: BorderRadius.only(
  //                         bottomRight: Radius.circular(5),
  //                         topRight: Radius.circular(5)),
  //                   ),
  //                   alignment: Alignment.center,
  //                   child: Text('Log in with Facebook',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.w400)),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     });

  Widget _googleLoginButton() =>
      ControlledWidgetBuilder<LoginController>(builder: (context, controller) {
        return InkWell(
          onTap: () {
            // controller.onClickGoogleLogin();
            _signInWithGoogle();
          },
          child: SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            // onPressed: () => _signInWithGoogle(context),
            // onPressed:,
          ),
        );
      });

  Widget _facebookLoginButton() =>
      ControlledWidgetBuilder<LoginController>(builder: (context, controller) {
        return InkWell(
          onTap: () {
            // controller.onClickFacebookLogin();
            _signInWithFacebook();
          },
          child: SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
          ),
        );
      });

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      "Synergy",
      style: TextStyle(
          color: Colors.black, fontSize: 48, fontWeight: FontWeight.bold),
    );
  }

  Widget get _emailPasswordWidget =>
      //ControlledWidgetBuilder <- 컨트룰러와 연결
      ControlledWidgetBuilder<LoginController>(builder: (context, controller) {
        return Column(
          children: <Widget>[
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

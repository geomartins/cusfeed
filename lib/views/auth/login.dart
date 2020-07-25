import 'dart:math';
import 'package:cusfeed/app/services/auth_service.dart';
import 'package:cusfeed/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loading_overlay/loading_overlay.dart';
import './password_reset.dart';
import '../admin/dashboard.dart';
import '../../app/repositories/pick.dart';

class Login extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String email;
  String password;
  bool isLoading = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    controller.addListener(() {
      setState(() {});
      //print(controller.value);
    });

    controller.forward();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  bool obscureStatus = true;
  void _toggleVisibility() {
    setState(() {
      obscureStatus = !obscureStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: LoadingOverlay(
        isLoading: isLoading,
        progressIndicator: kLoadingProgressIndicator,
        color: kLoadingOverlayColor,
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(kAppLogo, height: animation.value * kAppLogoHeight),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Welcome back',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 18.0,
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Log in with your email to use our app',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontSize: 13.0,
                        ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'ACCOUNT INFORMATION',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        child: TextFormField(
                          decoration:
                              kInputDecoration.copyWith(hintText: 'Email'),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid email address';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value.trim();
                            print(email);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        child: TextFormField(
                          obscureText: obscureStatus,
                          decoration: kInputDecoration.copyWith(
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: _toggleVisibility,
                              child: Icon(
                                obscureStatus == true
                                    ? Icons.remove_red_eye
                                    : Icons.panorama_fish_eye,
                                size: 18.0,
                              ),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value.trim();
                            print(password);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, PasswordReset.id);
                            },
                            child: Container(
                              child: Text(
                                'Forget your password?',
                                style: TextStyle(
                                  fontFamily: kFontFamilyLight,
                                  color: kPrimaryColor,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: deviceWidth,
                        margin: EdgeInsets.symmetric(vertical: 15.0),
                        child: Builder(
                          builder: (context) => FlatButton(
                            color: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                            textColor: Colors.white,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              if (_formKey.currentState.validate()) {
                                try {
                                  final result = await AuthService()
                                      .login(email: email, password: password);
                                  Navigator.pushNamed(context, Dashboard.id);
                                } catch (e) {
                                  String errorMessage =
                                      mPick.errorLog(code: e.code).toString();

                                  mPick.notify(
                                      context: context,
                                      message: errorMessage,
                                      color: Colors.red);
                                }
                              }

                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: Text('Login'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

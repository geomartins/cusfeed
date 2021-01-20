import 'package:cusfeed/app/services/auth_service.dart';
import 'package:cusfeed/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../auth/login.dart';
import '../../app/repositories/pick.dart';

class PasswordReset extends StatefulWidget {
  static const String id = '/password_reset';
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String email;
  bool isLoading = false;

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    controller.addListener(() {
      setState(() {});
      print(controller.value);
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

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: deviceHeight / 3,
                ),
                Image.asset(kAppLogo, height: kAppLogoHeight * animation.value),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Reset Password',
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
                    'Enter an email you use to sign in into',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontSize: 13.0,
                        ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        child: TextFormField(
                          style: TextStyle(),
                          decoration: kInputDecoration.copyWith(
                            hintText: 'Email Address',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please valid email address';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value.trim();
                          },
                        ),
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
                                  // await AuthService()
                                  //     .passwordReset(email: email);

                                  //display success message
                                  mPick.notify(
                                      context: context,
                                      message: 'Password reset successful',
                                      color: Colors.green);

                                  //Delay the navigation for 3 seconds
                                  await Future.delayed(Duration(seconds: 3));

                                  //Navigate back to login page
                                  Navigator.pushReplacementNamed(
                                      context, Login.id);
                                } catch (e) {
                                  String errorMessage =
                                      mPick.errorLog(code: e.code).toString();

                                  //display error message
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
                            child: Text('Reset Password'),
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

import 'package:cusfeed/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loading_overlay/loading_overlay.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: LoadingOverlay(
        isLoading: false,
        progressIndicator: kLoadingProgressIndicator,
        color: kLoadingOverlayColor,
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(kAppLogo, height: kAppLogoHeight),
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
                          style: TextStyle(),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            fillColor: Colors.grey.withOpacity(0.2),
                            border: InputBorder.none,
                            filled: true,
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        child: TextFormField(
                          obscureText: obscureStatus,
                          style: TextStyle(),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.grey.withOpacity(0.2),
                            border: InputBorder.none,
                            filled: true,
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
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/password_reset');
                            },
                            child: Container(
                              child: Text(
                                'Forget your password?',
                                style: TextStyle(
                                  fontFamily: kFontFamilyLight,
                                  color: Colors.teal,
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
                        child: FlatButton(
                          color: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, '/dashboard');
                          },
                          child: Text('Login'),
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

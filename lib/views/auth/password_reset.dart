import 'package:cusfeed/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loading_overlay/loading_overlay.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _formKey = GlobalKey<FormState>();

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
        isLoading: false,
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
                Image.asset(kAppLogo, height: kAppLogoHeight),
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
                          decoration: InputDecoration(
                            hintText: 'Email Address',
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
                        width: deviceWidth,
                        margin: EdgeInsets.symmetric(vertical: 15.0),
                        child: FlatButton(
                          color: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text('Reset Password'),
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

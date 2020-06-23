import 'package:cusfeed/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final Widget defaultSizedBox = SizedBox(height: 25.0);
  bool obscureStatus = true;

  void _toggleVisibility() {
    setState(() {
      obscureStatus = !obscureStatus;
    });
  }

  Future<Null> _launchURL() async {
    const url = 'https://agropark.ng';
    if (await canLaunch(url)) {
      print('Yesss');
      await launch(url);
    } else {
      print('Noooo');
      throw 'Could not launch $url';
    }
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
                    'Register',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 18.0,
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                defaultSizedBox,
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'PICK A USERNAME',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3.0),
                        child: TextFormField(
                          style: TextStyle(),
                          decoration: InputDecoration(
                            hintText: 'What is your company name',
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
                      defaultSizedBox,
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
                      Container(
                        width: deviceWidth,
                        margin: EdgeInsets.symmetric(vertical: 15.0),
                        child: FlatButton(
                          color: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text('Create an account'),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'By registering, you agree to $kAppName ',
                          style: Theme.of(context).textTheme.subtitle.copyWith(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontFamily: kFontFamilyLight,
                              ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(color: Colors.teal),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => _launchURL,
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => _launchURL,
                            ),
                          ],
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

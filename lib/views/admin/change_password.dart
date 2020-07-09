import 'package:cusfeed/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ChangePassword extends StatefulWidget {
  static const String id = '/change_password';

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
        centerTitle: true,
        title: Text(
          'Change Password',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
        iconTheme: IconThemeData(
          color: kPrimaryColor,
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cool_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LoadingOverlay(
          isLoading: false,
          progressIndicator: kLoadingProgressIndicator,
          color: kLoadingOverlayColor,
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
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
                          margin: EdgeInsets.symmetric(vertical: 3.0),
                          child: TextFormField(
                            obscureText: obscureStatus,
                            style: TextStyle(),
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
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
                            color: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                            textColor: Colors.white,
                            onPressed: () {},
                            child: Text('Update'),
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
      ),
    );
  }
}

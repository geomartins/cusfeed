import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cusfeed/app/services/auth_service.dart';
import 'package:cusfeed/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/services/location_service.dart';
import 'package:geolocator/geolocator.dart';
import '../../app/repositories/pick.dart';
import '../admin/dashboard.dart';

class Register extends StatefulWidget {
  static const String id = '/register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  //Firestore _firestore = Firestore.instance;

  bool isLoading = false;
  String email;
  String password;
  String company;

  String country;
  String locality;
  String isoCountryCode;

  @override
  void initState() {
    getCurrentLocation();
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
      // print(controller.value);
    });

    controller.forward();

    // TODO: implement initState
    super.initState();
  }

  void getCurrentLocation() async {
    try {
      final position = await LocationService().coordinate();

      List<Placemark> p = await LocationService().addressFromCoordinate(
          latitude: position.latitude, longitude: position.longitude);

      Placemark place = p[0];

      setState(() {
        country = place.country;
        locality = place.locality;
        isoCountryCode = place.isoCountryCode;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
      await launch(url);
    } else {
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
                RotationTransition(
                  turns: animation,
                  child: Image.asset(kAppLogo,
                      height: kAppLogoHeight * animation.value),
                ),
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
                          decoration: kInputDecoration.copyWith(
                            hintText: 'What is your company name',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your company name';
                            }
                            return null;
                          },
                          onChanged: (value) => company = value.trim(),
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
                          decoration: kInputDecoration.copyWith(
                            hintText: 'Email',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid email address';
                            }
                            return null;
                          },
                          onChanged: (value) => email = value.trim(),
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
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onChanged: (value) => password = value.trim(),
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
                                  // await AuthService().register(email, password);
                                  // await _firestore.collection('profiles').add({
                                  //   'email': email,
                                  //   'company': company,
                                  //   'country': country,
                                  //   'locality': locality,
                                  // });
                                  Navigator.pushReplacementNamed(
                                      context, Dashboard.id);
                                } catch (e) {
                                  String errorMessage =
                                      mPick.errorLog(code: e.code).toString();

                                  mPick.notify(
                                      context: context,
                                      message: errorMessage,
                                      color: Colors.red);
                                }

                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            child: Text('Create an account'),
                          ),
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
                              style: TextStyle(color: kPrimaryColor),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => _launchURL,
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: kPrimaryColor,
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

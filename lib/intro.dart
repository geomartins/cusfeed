import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'views/welcome.dart';
import 'config/constants.dart';

class Intro extends StatefulWidget {
  static const String id = '/intro';
  @override
  _IntroState createState() => new _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new Welcome(),
      imageBackground: AssetImage(
        kAppSplashScreenImage,
      ),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';
import 'config/constants.dart';
import 'intro.dart';
import './views/auth/login.dart';
import './views/auth/register.dart';
import './views/auth/password_reset.dart';
import './views/error/page_not_found.dart';

import './views/welcome.dart';
import './views/admin/change_password.dart';
import './views/admin/contact_us.dart';
import './views/admin/dashboard.dart';
import './views/admin/history.dart';
import './views/admin/profile.dart';
import './views/admin/success.dart';
import 'package:provider/provider.dart';
import './app/data/rating_data.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RatingData(),
      child: new MaterialApp(
        title: 'CusFeed',
        theme: ThemeData(
          buttonColor: kPrimaryColor,
          primaryColor: Color(0xFFAFB42B),
          accentColor: Color(0xFFFFC107),
          dividerColor: Color(0xFFBDBDBD),
          textTheme: TextTheme(
            headline: TextStyle(
              color: Color(0xFF212121),
              fontFamily: kFontFamily,
            ),
            title: TextStyle(
              color: Color(0xFF212121),
              fontFamily: kFontFamily,
            ),
            subtitle: TextStyle(
              color: Color(0xFF757575),
              fontFamily: kFontFamily,
            ),
            button: TextStyle(
              color: Color(0xFF212121),
              fontFamily: kFontFamily,
            ),
            body1: TextStyle(
              color: Color(0xFF212121),
              fontFamily: kFontFamily,
            ),
            body2: TextStyle(
              color: Color(0xFF212121),
              fontFamily: kFontFamily,
            ),
          ),
          iconTheme: IconThemeData(
            color: Color(0xFF212121),
          ),
        ),
        initialRoute: Intro.id,
        routes: {
          Intro.id: (BuildContext ctx) => Intro(),
          Welcome.id: (BuildContext ctx) => Welcome(),
          Register.id: (BuildContext ctx) => Register(),
          Login.id: (BuildContext ctx) => Login(),
          PasswordReset.id: (BuildContext ctx) => PasswordReset(),
          ChangePassword.id: (BuildContext ctx) => ChangePassword(),
          ContactUs.id: (BuildContext ctx) => ContactUs(),
          Dashboard.id: (BuildContext ctx) => Dashboard(),
          History.id: (BuildContext ctx) => History(),
          Profile.id: (BuildContext ctx) => Profile(),
          Success.id: (BuildContext ctx) => Success(),
        },
        onUnknownRoute: (RouteSettings setting) {
          String unknownRoute = setting.name;
          print(unknownRoute);
          return new MaterialPageRoute(
            builder: (context) => PageNotFound(),
          );
        },
      ),
    ),
  );
}

//TODO: Install custom clipper and use it on the login page

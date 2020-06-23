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

void main() async {
  runApp(
    new MaterialApp(
        title: 'CusFeed',
        theme: ThemeData(
          buttonColor: Colors.teal,
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
        initialRoute: '/intro',
        routes: {
          '/intro': (BuildContext ctx) => Intro(),
          '/welcome': (BuildContext ctx) => Welcome(),
          '/register': (BuildContext ctx) => Register(),
          '/login': (BuildContext ctx) => Login(),
          '/password_reset': (BuildContext ctx) => PasswordReset(),
          '/change_password': (BuildContext ctx) => ChangePassword(),
          '/contact_us': (BuildContext ctx) => ContactUs(),
          '/dashboard': (BuildContext ctx) => Dashboard(),
          '/history': (BuildContext ctx) => History(),
          '/profile': (BuildContext ctx) => Profile(),
          '/success': (BuildContext ctx) => Success(),
        },
        onUnknownRoute: (RouteSettings setting) {
          String unknownRoute = setting.name;
          print(unknownRoute);
          return new MaterialPageRoute(
            builder: (context) => PageNotFound(),
          );
        }),
  );
}

//TODO: Install custom clipper and use it on the login page

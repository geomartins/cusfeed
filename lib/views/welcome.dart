import 'package:cusfeed/config/constants.dart';
import 'package:flutter/material.dart';
import '../views/auth/login.dart';
import '../views/auth/register.dart';

class Welcome extends StatefulWidget {
  static const String id = '/welcome';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(kAppSplashScreenImage), fit: BoxFit.cover)),
        child: SafeArea(
          minimum: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Welcome to $kAppName',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0,
                      )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Text(
                  'App allows you to get customer feedback from your various stores and outlets ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
//                  shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.pushNamed(context, Login.id);
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      color: Theme.of(context).buttonColor,
                    ),
                    width: deviceWidth,
                  ),
                  SizedBox(
                    child: OutlineButton(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
//                  shape: StadiumBorder(),
                      borderSide: BorderSide(
                        color: Theme.of(context).buttonColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Register.id);
                      },
                      child: Text(
                        'Register',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    width: deviceWidth,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cusfeed/config/constants.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  static const String id = '/page_not_found';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 20.0, bottom: 100.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/error3.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: OutlineButton(
//                      borderSide: BorderSide(
//                        color: Theme.of(context).buttonColor,
//                      ),
                      color: kPrimaryColor,
                      //elevation: 5.0,
                      shape: StadiumBorder(),
                      child: Text(
                        'Back to home',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
